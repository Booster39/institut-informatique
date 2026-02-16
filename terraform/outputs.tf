output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "app_ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}

# URL d'accès au site : utiliser l'ALB pour HTTPS (avec certificat ACM)
output "app_alb_dns_name" {
  value       = aws_lb.main.dns_name
  description = "DNS de l'ALB : https://<dns_name> après avoir associé un domaine et un certificat ACM"
}

output "app_alb_zone_id" {
  value       = aws_lb.main.zone_id
  description = "Zone ID de l'ALB (pour enregistrement Route 53 alias)"
}
