variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "website_path" {
  description = "Path to website files"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Name = "Static Website"
  }
}
