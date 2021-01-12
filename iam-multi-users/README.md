# Terraform definitions

Let’s start by defining our input:

```hcl
variable "users" {
  description = "Map of IAM username to user details"
  type        = map(any)
}
```
which we’ll supply with a value like this:

```hcl
users = {
  alice = {
    pgp_key = "<user1's single-line base64-encoded public key (see above)>",
  },
  bob = {
    pgp_key = "<user2's single-line base64-encoded public key (see above)>",
  },
}
```

If, in the future, we want to manage these users more extensively (e.g. adding a policy to them to allow them to assume certain roles), this data structure can be extended to support that.

The resources look like:

```hcl
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
```

and we’ll output the encrypted values, which can be disseminated to the users:

```hcl
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
```
