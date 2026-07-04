variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket for static website hosting"
}

variable "lock_table_name" {
  type        = string
  description = "The name of the DynamoDB table for state locking"
}

variable "remote_state_bucket_name" {
  type        = string
  description = "The name of the S3 bucket for remote state storage"
}
