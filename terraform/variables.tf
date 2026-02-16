variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

# HTTPS : certificat ACM (créé dans la console AWS ou via Route 53)
# Sans certificat, l'ALB ne sert que du HTTP.
variable "acm_certificate_arn" {
  description = "ARN du certificat ACM pour HTTPS sur l'ALB (optionnel)"
  type        = string
  default     = ""
}
