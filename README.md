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

```hcl
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2

mQENBFkWilQBCADhq+ONGUppBNiggelOnW852qpnRdOTi1ZByx1ZWQPm1kSAtXDv
we/N6RbVaiA08wkx+oQbGNNviIoYRUEiM74EhEwJ71ibvOU58+19mWdQT0fP6vha
hazkXtb1hW7j9/mOfmHKnwsotI++lxLAOeEz/HEmnzbtJ67XpIZBKGkOYiyrVbu+
u9ggE5EWXCABp5DqdgrAIzYafm1vfBfABHSWz363vm8/aKKkCTHRtfJMSdQd9CD/
EQyV/0vnUZ9/v9qPhNN6XhMoazF9tVkYah6cWVeOkjvqMKG8thTuZbmi5biCTgId
....(etc.)
-----END PGP PUBLIC KEY BLOCK-----
```

More details:
```hcl
https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-gpg-key
```

# iam-multi-users: 

This Terraform to create Mutiple IAM users, and to set them up with IAM credentials (access key/secret) and login access to the web console. Terraform generate these secrets for us and give us PGP-encrypted output that we can distribute to the user.

AWS has an option to force the user to set his or her own password upon first login to the web console, and we’ll use that. The login profile resource will not interfere with the user changing.


# iam-user:

Terraform Moduleo to provision a  IAM user with establish a login profile and associate the user with IAM groups. 
