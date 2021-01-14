
data "aws_partition" "current" {}

# AWS Config module
#
provider "aws" {
  region = "ap-southeast-1"
  profile = var.profile
}
