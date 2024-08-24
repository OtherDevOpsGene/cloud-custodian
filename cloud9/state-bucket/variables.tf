variable "aws_region" {
  description = "The AWS region."
  type        = string
  default     = "us-east-2"
}

variable "namespace" {
  description = "Prefix for the S3 state bucket."
  type        = string
}

variable "bucket_name" {
  description = "The namefor the S3 state bucket."
  type        = string
}
