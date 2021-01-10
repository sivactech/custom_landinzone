provider "aws" {
  region = "ap-southeast-1"
  profile = var.profile
}

resource "aws_iam_user" "default" {
  count = var.create_user ? 1 : 0

  name                 = var.user_name
  path                 = var.path
  permissions_boundary = var.permissions_boundary
  force_destroy        = var.force_destroy
}

resource "aws_iam_user_login_profile" "default" {
  count = var.create_user && var.create_iam_user_login_profile ? 1 : 0

  user                    = aws_iam_user.default[count.index].name
  pgp_key                 = var.pgp_key
  password_length         = var.password_length
  password_reset_required = var.password_reset_required
  depends_on              = [aws_iam_user.default]
}

resource "aws_iam_access_key" "default" {
  count = var.create_user && var.create_iam_access_key && var.pgp_key != "" ? 1 : 0

  user    = aws_iam_user.default[0].name
  pgp_key = var.pgp_key
}

resource "aws_iam_user_group_membership" "default" {
  count      = var.create_user && length(var.groups) > 0 ? 1 : 0

  user       = aws_iam_user.default[count.index].name
  groups     = var.groups
  depends_on = [aws_iam_user.default]
}

#locals {
#  encrypted_password               = join("", aws_iam_user_login_profile.default.*.encrypted_password)
#  pgp_key_is_keybase               = length(regexall("keybase:", var.pgp_key)) > 0 ? true : false
#  keybase_password_decrypt_command = join("", data.template_file.keybase_password_decrypt_command.*.rendered)
#}

#data "template_file" "keybase_password_decrypt_command" {
#  count    = local.pgp_key_is_keybase ? 1 : 0
#  template = file("${path.module}/templates/keybase_password_decrypt_command.sh")

#  vars = {
#    encrypted_password = local.encrypted_password
#  }
#}