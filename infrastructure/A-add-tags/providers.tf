terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.64.0"
    }
  }

  required_version = ">= 1.9.4"

  backend "s3" {
    region  = "us-east-1"
    bucket  = "otherdevopsgene-cloudcustodian-state"
    key     = "01-add-tags"
    profile = ""
    encrypt = "true"

    dynamodb_table = "otherdevopsgene-cloudcustodian-state-lock"
  }
}

provider "aws" {
  region = var.aws_region
}
