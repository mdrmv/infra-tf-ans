locals {
  common_labels = merge(
    {
      managed_by  = "terraform"
      environment = var.environment
    },
    var.labels
  )
}

resource "yandex_iam_service_account" "s3" {
  folder_id   = var.folder_id
  name        = var.service_account_name
  description = "S3 access service account for ${var.environment}"
  labels      = local.common_labels
}

resource "yandex_storage_bucket" "private" {
  bucket                = var.private_bucket_name
  folder_id             = var.folder_id
  default_storage_class = var.default_storage_class
  max_size              = var.bucket_max_size_bytes
  force_destroy         = var.force_destroy
  tags                  = local.common_labels

  anonymous_access_flags {
    read        = false
    list        = false
    config_read = false
  }

  dynamic "versioning" {
    for_each = var.versioning_enabled ? [true] : []

    content {
      enabled = true
    }
  }

  dynamic "cors_rule" {
    for_each = var.private_cors_rules

    content {
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      allowed_headers = cors_rule.value.allowed_headers
      expose_headers  = cors_rule.value.expose_headers
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }
}

resource "yandex_storage_bucket" "public" {
  bucket                = var.public_bucket_name
  folder_id             = var.folder_id
  default_storage_class = var.default_storage_class
  max_size              = var.bucket_max_size_bytes
  force_destroy         = var.force_destroy
  tags                  = local.common_labels

  anonymous_access_flags {
    read        = true
    list        = false
    config_read = false
  }

  dynamic "versioning" {
    for_each = var.versioning_enabled ? [true] : []

    content {
      enabled = true
    }
  }

  dynamic "cors_rule" {
    for_each = var.public_cors_rules

    content {
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      allowed_headers = cors_rule.value.allowed_headers
      expose_headers  = cors_rule.value.expose_headers
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }
}

resource "yandex_storage_bucket_iam_binding" "private_s3" {
  bucket = yandex_storage_bucket.private.bucket
  role   = var.bucket_service_account_role

  members = [
    "serviceAccount:${yandex_iam_service_account.s3.id}"
  ]
}

resource "yandex_storage_bucket_iam_binding" "public_s3" {
  bucket = yandex_storage_bucket.public.bucket
  role   = var.bucket_service_account_role

  members = [
    "serviceAccount:${yandex_iam_service_account.s3.id}"
  ]
}

resource "yandex_lockbox_secret" "s3_credentials" {
  folder_id           = var.folder_id
  name                = var.lockbox_secret_name
  description         = "S3 credentials for ${var.environment} Object Storage buckets"
  deletion_protection = var.lockbox_deletion_protection
  labels              = local.common_labels
}

resource "yandex_iam_service_account_static_access_key" "s3" {
  service_account_id = yandex_iam_service_account.s3.id
  description        = "Static S3 access key for ${var.environment}"

  output_to_lockbox {
    secret_id            = yandex_lockbox_secret.s3_credentials.id
    entry_for_access_key = "${var.environment}/s3/access-key-id"
    entry_for_secret_key = "${var.environment}/s3/secret-access-key"
  }

  depends_on = [
    yandex_storage_bucket_iam_binding.private_s3,
    yandex_storage_bucket_iam_binding.public_s3
  ]
}
