terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }

  required_version = ">= 0.15"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
  shared_credentials_file = "/home/xs254-ayutha/.aws/credentials"
}



########################
# Bucket creation
########################
resource "aws_s3_bucket" "earthlybucket" {
  bucket = var.bucket_name
}



########################
# Disabling bucket
# public access
########################
resource "aws_s3_bucket_public_access_block" "earthlybucket_access" {
  bucket = aws_s3_bucket.earthlybucket.id

  # Block public access
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
