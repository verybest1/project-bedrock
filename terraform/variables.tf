variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "project-bedrock-cluster"
}

variable "student_id" {
  type        = string
  description = "Unique student identifier for globally unique S3 bucket naming"
  default     = "alt-soe-tin-025-0260"
}

variable "db_password" {
  type        = string
  description = "Master password for RDS databases"
  sensitive   = true
  default     = "BedrockSecure2026!"
}