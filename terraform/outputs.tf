output "cluster_endpoint" {
  value       = aws_eks_cluster.main.endpoint
  description = "EKS Control Plane Endpoint"
}

output "cluster_name" {
  value       = aws_eks_cluster.main.name
  description = "EKS Cluster Name"
}

output "region" {
  value       = var.aws_region
  description = "Deployment AWS Region"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC Identifier"
}

output "assets_bucket_name" {
  value       = aws_s3_bucket.assets.id
  description = "S3 Assets Bucket Name"
}

output "mysql_endpoint" {
  value = aws_db_instance.mysql.endpoint
}

output "postgres_endpoint" {
  value = aws_db_instance.postgres.endpoint
}