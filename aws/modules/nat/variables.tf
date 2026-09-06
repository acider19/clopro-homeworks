terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

variable "public_subnet_id" {
  description = "ID публичной подсети (в ней живёт NAT)"
  type        = string
}

variable "private_route_table_id" {
  description = "ID route table приватной подсети (в неё NAT кладёт маршрут)"
  type        = string
}

variable "igw_id" {
  description = "ID Internet Gateway (зависимость: NAT должен ждать IGW)"
  type        = string
}