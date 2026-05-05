module "object_storage" {
  source = "../../modules/object-storage"

  environment         = local.environment
  folder_id           = var.folder_id
  private_bucket_name = local.private_bucket_name
  public_bucket_name  = local.public_bucket_name

  service_account_name = "sa-finance-stage-s3"
  lockbox_secret_name  = "finance-stage-s3-credentials"

  bucket_max_size_bytes = var.bucket_max_size_bytes
  versioning_enabled    = var.versioning_enabled
  public_cors_rules     = var.public_cors_rules

  labels = local.common_labels
}
