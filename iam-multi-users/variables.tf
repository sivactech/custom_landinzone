variable "profile" {
    description = "AWS credentials profile you want to use"
    default = "test"
}
variable "users" {
  description = "Map of IAM username to user details"
  type        = map(any)
}