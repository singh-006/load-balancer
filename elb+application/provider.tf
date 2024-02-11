terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key = "123"
  secret_key = "abc"
}