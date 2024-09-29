terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.69.0"
    }
  }
  backend "s3" {
    bucket         = "kishore-terraform-remote-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "kishore_remote_state"
  }
}

provider "aws" {
  region = "us-east-1"
}