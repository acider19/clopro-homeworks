terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

variable "zone" {
  type = string
}

variable "nat_ip" {
  description = "Внутренний IP NAT-инстанса (next hop для private-сети)"
  type        = string
  default     = "192.168.10.254"
}