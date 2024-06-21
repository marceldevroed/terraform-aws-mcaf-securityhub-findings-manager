resource "aws_cloudwatch_log_group" "servicenow" {
  name              = "/aws/events/servicenow-integration"
  retention_in_days = var.cloudwatch_retention_days
  kms_key_id        = var.kms_key_arn
}

data "aws_iam_policy_document" "servicenow" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["${aws_cloudwatch_log_group.servicenow.arn}:*"]
    principals {
      identifiers = ["events.amazonaws.com", "delivery.logs.amazonaws.com"]
      type        = "Service"
    }

  }
}

resource "aws_cloudwatch_log_resource_policy" "servicenow" {
  policy_document = data.aws_iam_policy_document.servicenow.json
  policy_name     = "log-delivery-servicenow"
}
