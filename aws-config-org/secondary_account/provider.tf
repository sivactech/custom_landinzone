# Providers for secondary account
provider aws {
  alias  = "secondary-account-1"
  region = "ap-southeast-1" 
  profile                 = "test"
}

provider aws {
  alias  = "secondary-account-2"
  region = "ap-southeast-1"
  profile                 = "test1"
}
