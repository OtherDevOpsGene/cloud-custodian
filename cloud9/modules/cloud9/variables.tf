variable "aws_region" {
  description = "The AWS region."
  type        = string
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
