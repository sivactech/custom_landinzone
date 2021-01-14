output "bucket" {
  description = "The bucket name that config writes output to"
  value       = var.config_logs_bucket
}

output "bucket_arn" {
  description = "The bucket ARN that config writes output to"
  value       = aws_s3_bucket.main.arn
}

output "delivery_channel_id" {
  description = "The name of the delivery channel"
  value       = aws_config_delivery_channel.main.id
}

output "recorder_id" {
  description = "Name of the recorder"
  value       = aws_config_configuration_recorder.main.id
}


output "required_tags_rule_arn" {
  description = "The ARN of the required-tags config rule."
  value       = concat(aws_config_config_rule.required-tags.*.arn, [""])[0]
}

output "aws_config_role_arn" {
  description = "The ARN of the AWS config role."
  value       = aws_iam_role.main.arn
}

output "aws_config_role_name" {
  description = "The name of the IAM role used by AWS config"
  value       = aws_iam_role.main.name
}
