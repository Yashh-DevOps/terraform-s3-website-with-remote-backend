module "remote_backend" {
  source = "./modules/remote_backend"

  remote_state_bucket_name = var.remote_state_bucket_name
  dynamodb_lock_table_name = var.lock_table_name
}
module "static_website" {
  source       = "./modules/s3_static_website"
  bucket_name  = var.bucket_name
  website_path = "${path.root}/static_website"
  tags = {
    Name = "Static Website"
  }
}
