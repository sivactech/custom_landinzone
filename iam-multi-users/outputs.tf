output "users" {
  value = {
    for user in aws_iam_user.user :
    user.name => {
      access_key         = aws_iam_access_key.user[user.name].id,
      encrypted_secret   = aws_iam_access_key.user[user.name].encrypted_secret,
      encrypted_password = aws_iam_user_login_profile.user[user.name].encrypted_password,
    }
  }
}