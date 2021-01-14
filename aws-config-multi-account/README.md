# Examples

## Multi-account example

The two examples in this directory assume three AWS accounts and set up a Config Aggregator in one account and Two Source Account that points to its S3 Bucket in the other.

### Aggregator account

The main in [./aggregator_account](./aggregator_account) directory assumes Three AWS accounts and sets up the Config Aggregator.

```text
module "aggregator" {
  source                    = "../../"
  is_aggregator             = true
  aggregator_account_id     = var.aggregator_account_id
  aggregator_account_region = "ap-southeast-1"
  bucket_name               = var.bucket_name

  providers = {
    aws = aws.aggregator_account
  }
}
```

```text
▶ cd ./aggregator_account
▶ terraform init
▶ terraform apply
```

### Source account

The main in [./source_account](./source_account) meanwhile sets up the Source Account.

```text
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
```

```text
▶ cd ../source_account
▶ terraform init
▶ terraform apply
```

### Tear down

To tear down the Source Account:

```text
▶ terraform destroy
```

Then switch to the Aggregator Account and:

```text
▶ aws s3 rb s3://"bucket_name" --force
▶ cd ../aggregator_account
▶ terraform destroy
```
