# remote backend bucket name
variable "remote_state_bucket_name" {
  description = "S3 bucket name for Terraform state"
  type        = string
}
# dynamoDB lock table name
variable "dynamodb_lock_table_name" {
  description = "DynamoDB table name for state locking"
  type        = string
}

# common tags
variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    name = "terraform-remote-backend"
  }
}
