module "cloud9" {
  source = "./modules/cloud9"

  env_name      = var.env_name
  aws_region    = var.aws_region
  instance_type = var.instance_type
}
