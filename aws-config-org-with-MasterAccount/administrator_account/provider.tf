provider aws {
  region = "ap-southeast-1" 
  profile                 = "master"
}

provider aws {
  alias  = "secondary"
  region = "ap-southeast-1"
}