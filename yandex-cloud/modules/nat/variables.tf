# Модуль NAT: compute_instance с фикс. адресом 192.168.10.254
variable "zone" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ssh_public_key" {
  type = string
}