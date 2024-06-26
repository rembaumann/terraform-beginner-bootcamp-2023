terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 16
  special          = false
  override_special = ""
}

output "random_bucket_name_id" {
    value =  random_string.bucket_name.id
}

output "random_bucket_name_result" {
    value =  random_string.bucket_name.result
}