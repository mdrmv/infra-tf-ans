provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
  endpoint                 = var.yandex_api_endpoint
  storage_endpoint         = var.yandex_storage_endpoint
  service_account_key_file = pathexpand(var.service_account_key_file)
}
