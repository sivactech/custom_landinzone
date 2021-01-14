variable "bucket_name" {
    default     = "central-config-bucke-ocbc"
}

module "source_account1" {
  source        = "../../"
  is_aggregator = false
  bucket_name   = var.bucket_name


  providers = {
    aws = aws.source_account1
  }
}


module "source_account2" {
  source = "../../"

  is_aggregator = false
  bucket_name   = var.bucket_name

  providers = {
    aws = aws.source_account2
  }
}