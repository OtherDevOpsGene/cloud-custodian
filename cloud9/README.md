# cloud9

Builds a Cloud9 environment for the Cloud Custodian demos.

## Prerequisites

Edit `terraform.tfvars` to set up variables.

Locally, Ansible and the session-manager plugin need to be installed.
So do the Galaxy roles.

```shell
pip install -U ansible boto3
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb
ansible-galaxy role install andrewrothstein.terraform
```

## Testing

Test the dynamic inventory with

``` shell
ansible-inventory -i inventory-aws_ec2.yaml --graph
```

## Running

```shell
terraform init  # or terraform init --upgrade
terraform apply
ansible-playbook -i inventory-aws_ec2.yaml terraform.yaml
ansible-playbook -i inventory-aws_ec2.yaml custodian.yaml
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.64.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud9"></a> [cloud9](#module\_cloud9) | ./modules/cloud9 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account"></a> [aws\_account](#input\_aws\_account) | The account ID for this account. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region. | `string` | `"us-east-2"` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | The name of the Cloud9 instance. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance\_type for the Cloud9 instances. | `string` | `"t3.small"` | no |
| <a name="input_owner_email"></a> [owner\_email](#input\_owner\_email) | The email address of the person responsible for the resources. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
