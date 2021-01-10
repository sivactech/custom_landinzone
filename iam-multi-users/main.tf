provider "aws" {
  region = "ap-southeast-1"
  profile = var.profile
}

resource "aws_iam_user" "user" {
  for_each = var.users
  name = each.key
}

resource "aws_iam_access_key" "user" {
  for_each = toset([for user in aws_iam_user.user : user.name])

  user    = each.key
  pgp_key = var.users[each.key].pgp_key
}

resource "aws_iam_user_login_profile" "user" {
  for_each = toset([for user in aws_iam_user.user : user.name])

  user                    = each.key
  pgp_key                 = var.users[each.key].pgp_key
  password_reset_required = true
}