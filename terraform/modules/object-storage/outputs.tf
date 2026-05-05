output "private_bucket_name" {
  description = "Private bucket name."
  value       = yandex_storage_bucket.private.bucket
}

output "public_bucket_name" {
  description = "Public bucket name."
  value       = yandex_storage_bucket.public.bucket
}

output "object_storage_endpoint" {
  description = "S3-compatible Object Storage endpoint."
  value       = var.object_storage_endpoint
}

output "object_storage_region" {
  description = "S3-compatible Object Storage region."
  value       = var.object_storage_region
}

output "service_account_id" {
  description = "S3 service account ID."
  value       = yandex_iam_service_account.s3.id
}

output "static_access_key_id" {
  description = "Static S3 access key resource ID."
  value       = yandex_iam_service_account_static_access_key.s3.id
}

output "lockbox_secret_id" {
  description = "Lockbox secret ID with S3 credentials."
  value       = yandex_lockbox_secret.s3_credentials.id
}

output "lockbox_secret_name" {
  description = "Lockbox secret name with S3 credentials."
  value       = yandex_lockbox_secret.s3_credentials.name
}

output "lockbox_secret_version_id" {
  description = "Lockbox secret version ID with S3 credentials."
  value       = yandex_iam_service_account_static_access_key.s3.output_to_lockbox_version_id
}
