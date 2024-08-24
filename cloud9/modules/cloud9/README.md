# cloud9

A Terraform module to set up a Cloud9 environment. 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.64.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.64.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloud9_environment_ec2.student](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloud9_environment_ec2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account"></a> [aws\_account](#input\_aws\_account) | The account ID for this account. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region. | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | The name of the Cloud9 instance. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance\_type for the Cloud9 instances. | `string` | `"t3.small"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud9_url"></a> [cloud9\_url](#output\_cloud9\_url) | n/a |
<!-- END_TF_DOCS -->
