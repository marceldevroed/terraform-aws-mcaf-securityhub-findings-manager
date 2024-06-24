variable "cloudwatch_retention_days" {
  type        = number
  default     = 365
  description = "Time to retain the CloudWatch Logs for the ServiceNow integration"
}

variable "create_access_keys" {
  type        = bool
  default     = false
  description = "Whether to create an access_key and secret_access key for the ServiceNow user"
}

variable "severity_label_filter" {
  type        = list(string)
  default     = []
  description = "List describing the events to push to the ServiceNow queue based on the Severity Label"
}

variable "kms_key_arn" {
  type        = string
  description = "The ARN of the KMS key used to encrypt the resources"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources"
}
