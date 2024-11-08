terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.68.0"
    }
  }
  #remote state
  backend "s3" {
    bucket = "aws-raidi-state"
    key    = "remote-state-demo"
    region = "us-east-1"
    dynamodb_table = "aws-locking" # locking 
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
