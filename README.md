# Clean Your Cloud with Cloud Custodian

Notes for the demos that accompany the presentation.

The slides are at https://www.slideshare.net/slideshow/clean-your-cloud-with-cloud-custodian-slides/272470133.

## Preparation

Make sure you are logged into AWS.

Open two consoles: in one `cd ~/git/cloud-custodian/policies/ && code .`
and the other `cd ~/git/cloud-custodian/infrastructure/`.

```shell
aws sts get-caller-identity
export AWS_DEFAULT_REGION=us-east-1
pip install -U c7n c7n-org
```

In the infrastructure console:

```shell
cd A-add-tags
terraform init
terraform apply
cd ../B-another-project
terraform init
# don't apply yet
```

Open a browser page and sign in to AWS.
[EC2](https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#Instances:instanceState=running)

## Scenario 1: Add project tags

Show [01-add-tags.yml](/policies/01-add-tags.yml).

```shell
custodian validate 01-add-tags.yml
custodian run --dry-run --output-dir=output 01-add-tags.yml
```

Show the tags for one of the instances. Then show via the console.

```shell
aws ec2 describe-instances | jq '.Reservations[].Instances[] | [.InstanceId, .Tags]'
custodian run --output-dir=output 01-add-tags.yml
aws ec2 describe-instances | jq '.Reservations[].Instances[] | [.InstanceId, .Tags]'
```

## Getting detailed help

```shell
custodian schema aws
custodian schema aws.ec2
custodian schema aws.ec2.actions
custodian schema aws.ec2.actions.tag
```

## Scenario 2: Add more project tags

Show [02-add-tags.yml](/policies/02-add-tags.yml).

```shell
custodian run --dry-run --output-dir=output 02-add-tags.yml
```

No results!

```shell
custodian run --dry-run --output-dir=output 02-add-tags.yml
custodian run --dry-run --cache-period=0 --output-dir=output 02-add-tags.yml
custodian run --cache-period=0 --output-dir=output 02-add-tags.yml
aws ec2 describe-instances | jq '.Reservations[].Instances[] | [.InstanceId, .Tags]'
```

## Scenario 3: Required tags

In the infrastructure console, stand up some additional servers:

```shell
terraform apply
```

Show the new servers and then the tags for one of the new instances.

Show [03-enforce-tags.yml](/policies/03-enforce-tags.yml).

```shell
custodian run --cache-period=0 --output-dir=output 03-enforce-tags.yml
aws ec2 describe-instances | jq '.Reservations[].Instances[] | [.InstanceId, .State, .Tags]'
```

Show the browser window again and remove the `running` filter.

Show [04-enforce-tags-scheduled.yml](/policies/04-enforce-tags-scheduled.yml).

```shell
custodian run --cache-period=0 --output-dir=output 04-enforce-tags-scheduled.yml
```

Show the browser window again and go to the `lambda` service. Then show the
`Monitor` tab for one to jump to `View CloudWatch logs`.

```shell
custodian run --cache-period=0 --output-dir=output 05-enforce-tags-manual.yml
```

Show the browser window again go back to EC2. Pick one of the stopped
`accounting` servers and look at the tags.

## Generate reports

```shell
custodian report --output-dir=output 05-enforce-tags-manual.yml
custodian report --output-dir=output 05-enforce-tags-manual.yml --format simple
custodian report --output-dir=output 05-enforce-tags-manual.yml --format grid
custodian report --output-dir=output 05-enforce-tags-manual.yml --format json
```

Show [06-billing-report.yml](/policies/06-billing-report.yml).

```shell
custodian run --cache-period=0 --output-dir=output 06-billing-report.yml
custodian report --output-dir=output 06-billing-report.yml --format simple
custodian report --output-dir=output 06-billing-report.yml --format simple --field Owner=tag:owner --field Project=tag:project
```

## Scenario 7: Shut down after hours

Show [07-off-hours.yml](/policies/07-off-hours.yml).

```shell
custodian run --cache-period=0 --output-dir=output 07-off-hours.yml
```

Show the browser window again and go to the `lambda` service.
Point out the 2 new functions.

Show [Example offhours
policy](https://cloudcustodian.io/docs/aws/examples/offhours.html#).

## Across accounts

Show [accounts.yml](/policies/accounts.yml).
