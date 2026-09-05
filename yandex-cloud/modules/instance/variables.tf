# Модуль instance: compute_instance с публичным/приватным доступом
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