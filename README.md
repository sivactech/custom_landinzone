# AWS Identity and Access Management (IAM) Terraform

iam-user
iam-multi-users


## Prerequisites:

1. Programmatic access, with adequate permissions, to your AWS account
2. Terraform v0.12 or higher installed on your local machine
3. Keybase configured locally and/or GPG Suite

## PGP usage with GPG

Each user will have to supply a PGP key. Generate a key by running this and following the prompts: 

$ gpg --gen-key

the format Terraform wants (single line, no header/footer, remove second base64-encoded string

$ gpg --export "Key Name" |base64
More infor: https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-gpg-key

# iam-multi-users: 

This Terraform to create Mutiple IAM users, and to set them up with IAM credentials (access key/secret) and login access to the web console. Terraform generate these secrets for us and give us PGP-encrypted output that we can distribute to the user.

AWS has an option to force the user to set his or her own password upon first login to the web console, and we’ll use that. The login profile resource will not interfere with the user changing.


# iam-user:

Terraform Moduleo to provision a  IAM user with establish a login profile and associate the user with IAM groups. 
