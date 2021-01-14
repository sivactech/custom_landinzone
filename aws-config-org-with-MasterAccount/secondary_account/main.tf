module "account1" {
  source = "./aggregation"

  source_account_number = var.source_account_number
  providers = {
    aws = aws.secondary-account-1
  }
}

module "account2" {
  source = "./aggregation"

  source_account_number = var.source_account_number
  providers = {
    aws = aws.secondary-account-2
  }
}

module "iam" {
  source = "./aggregation/iam"

  providers = {
    aws = aws.secondary-account-1
  }
}

module "iam1" {
  source = "./aggregation/iam"

  providers = {
    aws = aws.secondary-account-2
  }
}