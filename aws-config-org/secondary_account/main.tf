module "ap-southeast-1" {
  source = "./aggregation"

  source_account_number = var.source_account_number
  providers = {
    aws = aws.secondary-account-1
  }
}

#module "us-east-2" {
#  source = "./aggregation"

#  source_account_number = var.source_account_number
#  providers = {
#    aws = aws.secondary-account-2
#  }
#}

module "iam" {
  source = "./aggregation/iam"

  providers = {
    aws = aws.secondary-account-1
  }
}