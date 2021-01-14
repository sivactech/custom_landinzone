variable "aggregator_account_id" {}
variable "source_account_ids" {}
variable "bucket_name" {}

module "aggregator" {
  source                    = "../../"
  is_aggregator             = true
  aggregator_account_id     = var.aggregator_account_id
  aggregator_account_region = "ap-southeast-1"
 # source_account_ids        = [var.source_account_ids]
  bucket_name               = var.bucket_name

  providers = {
    aws = aws.aggregator_account
  }
}
