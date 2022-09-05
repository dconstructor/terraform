terraform {
  required_version = "~> 1.2.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.29.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
  profile = "default"
}