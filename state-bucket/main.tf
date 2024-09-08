module "tfstate-backend" {
  source  = "cloudposse/tfstate-backend/aws"
  version = "1.5.0"

  namespace = var.namespace
  name      = var.bucket_name

  force_destroy = false
}

output "terraform_backend_config" {
  value = module.tfstate-backend.terraform_backend_config
}
