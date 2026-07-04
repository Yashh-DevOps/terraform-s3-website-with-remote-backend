output "bucket_name" {
  description = "Name of the S3 bucket hosting the static website"
  value       = aws_s3_bucket.static_site_bucket.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket hosting the static website"
  value       = aws_s3_bucket.static_site_bucket.arn
}

output "website_endpoint" {
  description = "Website endpoint for accessing the S3 hosted website"
  value       = aws_s3_bucket_website_configuration.website_config.website_endpoint
}
