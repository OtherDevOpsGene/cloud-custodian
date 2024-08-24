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
    bucket  = "otherdevopsgene-cloud-custodian-workspace"
    key     = "terraform.tfstate"
    profile = ""
    encrypt = "true"

    dynamodb_table = "otherdevopsgene-cloud-custodian-workspace-lock"
  }
}

provider "aws" {
  region = var.aws_region
}
