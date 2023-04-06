terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}
provider "aws" {
  region = var.region_name
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}