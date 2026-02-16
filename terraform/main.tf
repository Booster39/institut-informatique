terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "s3" {
    bucket = "institut-terraform-state"
    key    = "terraform.tfstate"
    # Utiliser la même région que le bucket S3 créé (eu-west-3)
    region = "eu-west-3"
  }
}

provider "aws" {
  region = var.aws_region
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "institut-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "institut-igw"
  }
}

# Public Subnets
resource "aws_subnet" "public" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index + 1}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name = "institut-public-subnet-${count.index + 1}"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index + 10}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "institut-private-subnet-${count.index + 1}"
  }
}

# Route Table for Public Subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "institut-public-rt"
  }
}

# Route Table Associations
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# RDS PostgreSQL
resource "aws_db_instance" "postgres" {
  identifier     = "institut-postgres"
  engine         = "postgres"
  instance_class = "db.t3.micro"

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_type          = "gp3"

  db_name  = "institut_db"
  username = "institut_user"
  password = var.db_password

  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name

  # Free tier : rétention de sauvegarde limitée
  # 0 = pas de sauvegardes automatiques (acceptable pour un environnement de démo)
  backup_retention_period = 0
  skip_final_snapshot    = true

  tags = {
    Name = "institut-postgres"
  }
}

# DB Subnet Group
resource "aws_db_subnet_group" "main" {
  name       = "institut-db-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "institut-db-subnet-group"
  }
}

#
# Security Groups
#

# SG pour RDS (accès uniquement depuis le VPC)
resource "aws_security_group" "rds" {
  name_prefix = "institut-rds-"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "institut-rds-sg"
  }
}

# SG pour l'EC2 applicatif (HTTP ouvert au monde)
resource "aws_security_group" "app_ec2" {
  name_prefix = "institut-ec2-"
  vpc_id      = aws_vpc.main.id

  # HTTP (80) pour éventuellement exposer directement Nginx
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Port 4200 pour accéder au frontend (mapping 4200:80 dans docker-compose)
  ingress {
    from_port   = 4200
    to_port     = 4200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "institut-ec2-sg"
  }
}

#
# Data Sources
#

data "aws_availability_zones" "available" {
  state = "available"
}

# AMI Amazon Linux 2 pour l'instance EC2
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

#
# EC2 pour héberger l'application (Docker + Docker Compose)
#

resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.app_ec2.id]
  associate_public_ip_address = true

  tags = {
    Name = "institut-app-ec2"
  }

  user_data = base64encode(<<EOF
#!/bin/bash
exec > >(tee /var/log/user-data.log) 2>&1

echo "=== Démarrage user_data $(date) ==="

yum update -y
amazon-linux-extras install docker -y
systemctl enable docker
systemctl start docker
echo "Docker installé et démarré."

curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo "Docker Compose installé."

yum install -y git

cd /opt
if [ -d "institut-informatique" ]; then
  cd institut-informatique && git pull && cd /opt
else
  git clone https://github.com/Booster39/institut-informatique.git institut-informatique || { echo "ERREUR git clone"; exit 1; }
fi

cd /opt/institut-informatique
echo "Répertoire: $(pwd), contenu: $(ls -la)"

if [ -f ".env.example" ] && [ ! -f ".env" ]; then
  cp .env.example .env
fi

echo "Lancement docker-compose..."
docker-compose up -d --build
echo "=== Fin user_data $(date) ==="
EOF
  )
}

#
# Application Load Balancer (HTTPS en production)
#

resource "aws_security_group" "alb" {
  name_prefix = "institut-alb-"
  vpc_id      = aws_vpc.main.id
  description = "ALB pour frontend (HTTP/HTTPS)"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "institut-alb-sg" }
}

resource "aws_lb" "main" {
  name               = "institut-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = aws_subnet.public[*].id

  tags = { Name = "institut-alb" }
}

resource "aws_lb_target_group" "app" {
  name     = "institut-app-tg"
  port     = 4200
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
  }

  tags = { Name = "institut-app-tg" }
}

resource "aws_lb_target_group_attachment" "app" {
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = aws_instance.app_server.id
  port             = 4200
}

# HTTP : redirection vers HTTPS si certificat fourni, sinon forward vers l'app
resource "aws_lb_listener" "http_redirect" {
  count = var.acm_certificate_arn != "" ? 1 : 0

  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "http_forward" {
  count = var.acm_certificate_arn == "" ? 1 : 0

  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}

# HTTPS (uniquement si certificat ACM fourni)
resource "aws_lb_listener" "https" {
  count = var.acm_certificate_arn != "" ? 1 : 0

  load_balancer_arn = aws_lb.main.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}
