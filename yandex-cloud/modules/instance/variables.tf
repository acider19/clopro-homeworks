terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

variable "name" {
  type = string
}

variable "zone" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "assign_public_ip" {
  description = "Назначать ли публичный IP"
  type        = bool
  default     = false
}

variable "cpu" {
  description = "Число ядер"
  type        = number
  default     = 2
}

variable "core_fraction" {
  description = "Доля ядер"
  type        = number
  default     = 5
}

variable "ram" {
  description = "Объём памяти, ГБ"
  type        = number
  default     = 1
}

variable "disk_type" {
  description = "Тип диска"
  type        = string
  default     = "network-hdd"
}

variable "disk_size" {
  description = "Размер диска, ГБ"
  type        = number
  default     = 10
}
