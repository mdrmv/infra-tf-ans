output "private_bucket_name" {
  description = "Private bucket name."
  value       = module.object_storage.private_bucket_name
}

output "public_bucket_name" {
  description = "Public bucket name."
  value       = module.object_storage.public_bucket_name
}

output "object_storage_endpoint" {
  description = "S3-compatible Object Storage endpoint."
  value       = module.object_storage.object_storage_endpoint
}

output "object_storage_region" {
  description = "S3-compatible Object Storage region."
  value       = module.object_storage.object_storage_region
}

output "s3_service_account_id" {
  description = "S3 service account ID."
  value       = module.object_storage.service_account_id
}

output "s3_static_access_key_id" {
  description = "Static S3 access key resource ID."
  value       = module.object_storage.static_access_key_id
}

output "s3_lockbox_secret_id" {
  description = "Lockbox secret ID with S3 credentials."
  value       = module.object_storage.lockbox_secret_id
}

output "s3_lockbox_secret_name" {
  description = "Lockbox secret name with S3 credentials."
  value       = module.object_storage.lockbox_secret_name
}
