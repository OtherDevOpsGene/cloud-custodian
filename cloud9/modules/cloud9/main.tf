resource "aws_cloud9_environment_ec2" "workspace" {
  instance_type   = var.instance_type
  name            = var.env_name
  image_id        = "amazonlinux-2023-x86_64"
  connection_type = "CONNECT_SSM"

  tags = var.tags
}

output "cloud9_url" {
  value = "https://${var.aws_region}.console.aws.amazon.com/cloud9/ide/${aws_cloud9_environment_ec2.workspace.id}"
}
