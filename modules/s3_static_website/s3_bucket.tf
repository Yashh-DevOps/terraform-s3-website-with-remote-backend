# this resource creates an s3 bucket for static website hosting
resource "aws_s3_bucket" "static_site_bucket" {
  bucket = var.bucket_name

  tags = var.tags
}


# this resource allows public access to the s3 bucket
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.static_site_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# object going to upload to the s3 bucket
resource "aws_s3_object" "website_files" {
  for_each     = fileset(var.website_path, "**")
  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")
  bucket       = aws_s3_bucket.static_site_bucket.id
  key          = each.value
  source       = "${var.website_path}/${each.value}"
  etag         = filemd5("${var.website_path}/${each.value}")
}

# policy to allow public read access to the s3 bucket
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_site_bucket.id
  depends_on = [
    aws_s3_bucket_public_access_block.public_access_block
  ]
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = "${aws_s3_bucket.static_site_bucket.arn}/*"
      }
    ]
  })
}


# this resource configures the s3 bucket for static website hosting
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.static_site_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# this resource enables versioning for the s3 bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.static_site_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
