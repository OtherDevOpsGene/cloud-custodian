data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "lambda_execute" {
  name = "AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy" "cloud_custodian_ec2" {
  name        = "cloud_custodian_ec2"
  description = "Policy for Cloud Custodian to start and stop instances"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "ec2:CreateTags",
          "ec2:DeleteTags",
          "ec2:DescribeInstanceStatus",
          "ec2:DescribeInstances",
          "ec2:DescribeTags",
          "ec2:MonitorInstances",
          "ec2:RunInstances",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:TerminateInstances",
          "ec2:UnmonitorInstances"
        ],
        "Resource" : [
          "*"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "custodian-ec2-role" {
  name                = "custodian-ec2-role"
  assume_role_policy  = data.aws_iam_policy_document.lambda_assume_role_policy.json
  managed_policy_arns = [data.aws_iam_policy.lambda_execute.arn, aws_iam_policy.cloud_custodian_ec2.arn]
}
