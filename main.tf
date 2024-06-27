terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
provider "aws" {
  # Configuration options
  region = "us-east-1"
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 16
  lower            = true
  upper            = false
  special          = false
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name_result" {
    value =  random_string.bucket_name.result
}