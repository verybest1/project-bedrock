terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket = "bedrock-terraform-state-090686622011"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "tinyuka-2025-capstone"
      Environment = "production"
      ManagedBy   = "Terraform"
    }
  }
}