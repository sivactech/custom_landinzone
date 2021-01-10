output "user_name" {
  description = "IAM user name"
  value       = join("", aws_iam_user.default.*.name)
}

output "user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = join("", aws_iam_user.default.*.arn)
}

output "user_unique_id" {
  description = "The unique ID assigned by AWS"
  value       = join("", aws_iam_user.default.*.unique_id)
}

output "user_login_profile_encrypted_password" {
  description = "The encrypted password, base64 encoded"
  value       = aws_iam_user_login_profile.default.*.encrypted_password
}

output "user_access_key" {
  description = "The Access key"
  value         = aws_iam_access_key.default.*.id
}

output "user_access_key_encrypted_secret" {
  description = "The encrypted secret key, base64 encoded"
  value   = aws_iam_access_key.default.*.encrypted_secret
}

#output "keybase_password_decrypt_command" {
#  description = "Command to decrypt the Keybase encrypted password. Returns empty string if pgp_key is not from keybase"
#  value       = local.keybase_password_decrypt_command
#}