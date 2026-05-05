variable "environment" {
  description = "Environment name, for example finance-stage."
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud folder ID where resources are created."
  type        = string
}

variable "private_bucket_name" {
  description = "Private Object Storage bucket name."
  type        = string
}

variable "public_bucket_name" {
  description = "Public Object Storage bucket name."
  type        = string
}

variable "service_account_name" {
  description = "Service account name used for S3 access."
  type        = string
}

variable "bucket_service_account_role" {
  description = "Bucket-level storage role assigned to the S3 service account."
  type        = string
  default     = "storage.editor"
}

variable "lockbox_secret_name" {
  description = "Lockbox secret name for S3 credentials."
  type        = string
}

variable "object_storage_endpoint" {
  description = "S3-compatible Object Storage endpoint."
  type        = string
  default     = "https://storage.yandexcloud.kz"
}

variable "object_storage_region" {
  description = "S3-compatible Object Storage region."
  type        = string
  default     = "kz1"
}

variable "default_storage_class" {
  description = "Default Object Storage class."
  type        = string
  default     = "STANDARD"

  validation {
    condition     = contains(["STANDARD", "COLD", "ICE"], var.default_storage_class)
    error_message = "Allowed values: STANDARD, COLD, ICE."
  }
}

variable "versioning_enabled" {
  description = "Enable bucket versioning."
  type        = bool
  default     = true
}

variable "bucket_max_size_bytes" {
  description = "Optional bucket max size in bytes. Null means no explicit limit."
  type        = number
  default     = null

  validation {
    condition     = var.bucket_max_size_bytes == null ? true : var.bucket_max_size_bytes > 0
    error_message = "bucket_max_size_bytes must be null or greater than zero."
  }
}

variable "force_destroy" {
  description = "Allow Terraform to delete non-empty buckets. Keep false in production."
  type        = bool
  default     = false
}

variable "lockbox_deletion_protection" {
  description = "Protect Lockbox secret from accidental deletion."
  type        = bool
  default     = true
}

variable "public_cors_rules" {
  description = "CORS rules for the public bucket."
  type = list(object({
    allowed_methods = list(string)
    allowed_origins = list(string)
    allowed_headers = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  }))
  default = []
}

variable "private_cors_rules" {
  description = "CORS rules for the private bucket."
  type = list(object({
    allowed_methods = list(string)
    allowed_origins = list(string)
    allowed_headers = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  }))
  default = []
}

variable "labels" {
  description = "Common resource labels/tags."
  type        = map(string)
  default     = {}
}
