# Remote Backend Outputs
output "state_bucket_name" {
  description = "Name of the S3 bucket used for Terraform state"
  value       = module.remote_backend.state_bucket_name
}

output "state_bucket_arn" {
  description = "ARN of the S3 bucket used for Terraform state"
  value       = module.remote_backend.state_bucket_arn
}

output "lock_table_name" {
  description = "Name of the DynamoDB table used for state locking"
  value       = module.remote_backend.lock_table_name
}

# Static Website Outputs
output "website_bucket_name" {
  description = "Name of the S3 bucket hosting the static website"
  value       = module.static_website.bucket_name
}

output "website_bucket_arn" {
  description = "ARN of the S3 bucket hosting the static website"
  value       = module.static_website.bucket_arn
}

output "website_endpoint" {
  description = "Website endpoint for accessing the S3 hosted website"
  value       = module.static_website.website_endpoint
}
