terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "haroon-practice-terraform-dev"
    key    = "roboshop-dev-vpc"
    use_lockfile = true
    encrypt = true
    region = "us-east-1"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}