# Providers for secondary account
provider aws {
  alias  = "aggregator_account"
  region = "ap-southeast-1" 
  profile                 = "test1"
}

provider aws {
  alias  = "source_account1"
  region = "ap-southeast-1"
  profile                 = "test"
}

provider aws {
  alias  = "source_account2"
  region = "ap-southeast-1"
  profile                 = "master"
}