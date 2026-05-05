variable "cloud_id" {
  description = "Yandex Cloud ID."
  type        = string
}

variable "folder_id" {
  description = "finance-stage folder ID."
  type        = string
}

variable "zone" {
  description = "Default Yandex Cloud KZ availability zone."
  type        = string
  default     = "kz1-a"
}

variable "yandex_api_endpoint" {
  description = "Yandex Cloud KZ API endpoint."
  type        = string
  default     = "api.yandexcloud.kz:443"
}

variable "service_account_key_file" {
  description = "Local path to Terraform service account JSON key."
  type        = string
  default     = "~/.config/yandex-cloud/sa-terraform-infra-key.json"
}

variable "bucket_max_size_bytes" {
  description = "Optional max size for each bucket in bytes. Null means no explicit limit."
  type        = number
  default     = null
}

variable "versioning_enabled" {
  description = "Enable versioning on both buckets."
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
