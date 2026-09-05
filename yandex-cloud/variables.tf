variable "folder_id" {
  description = "Идентификатор каталога (folder) в Yandex Cloud"
  type        = string
}

variable "cloud_id" {
  description = "Идентификатор облака в Yandex Cloud"
  type        = string
  default     = ""
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-b"
}

variable "service_account_key_file" {
  description = "Путь к ключу сервисного аккаунта"
  type        = string
  default     = "/Users/master/.authorized_key.json"
}

variable "ssh_public_key_path" {
  description = "Путь к публичному SSH-ключу"
  type        = string
}