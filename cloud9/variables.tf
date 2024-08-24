variable "owner_email" {
  description = "The email address of the person responsible for the resources."
  type        = string
}

variable "aws_account" {
  description = "The account ID for this account."
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "The AWS region."
  type        = string
  default     = "us-east-2"
}

variable "instance_type" {
  description = "The instance_type for the Cloud9 instances."
  type        = string
  default     = "t3.small"
}

variable "env_name" {
  description = "The name of the Cloud9 instance."
  type        = string
}
