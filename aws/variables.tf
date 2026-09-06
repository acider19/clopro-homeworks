variable "region" {
  description = "Регион AWS"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  description = "CIDR VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR публичной подсети (бастион, NAT)"
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR приватной подсети"
  type        = string
  default     = "10.10.2.0/24"
}

variable "public_az" {
  description = "AZ для публичной подсети"
  type        = string
  default     = "eu-north-1a"
}

variable "private_az" {
  description = "AZ для приватной подсети"
  type        = string
  default     = "eu-north-1b"
}

variable "ssh_public_key_path" {
  description = "Путь к публичному SSH-ключу"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "key_name" {
  description = "Имя key pair в AWS"
  type        = string
  default     = "clopro-15"
}

variable "instance_type" {
  description = "Тип инстанса"
  type        = string
  default     = "t3.micro"
}