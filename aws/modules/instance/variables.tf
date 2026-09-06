terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

variable "name" {
  description = "Имя инстанса"
  type        = string
}

variable "subnet_id" {
  description = "ID подсети, в которую помещается инстанс"
  type        = string
}

variable "security_group_id" {
  description = "ID security group"
  type        = string
}

variable "key_name" {
  description = "Имя key pair для SSH"
  type        = string
}

variable "instance_type" {
  description = "Тип инстанса"
  type        = string
  default     = "t3.micro"
}

variable "assign_public_ip" {
  description = "Назначить публичный IP (бастион) или нет (приватная ВМ)"
  type        = bool
}