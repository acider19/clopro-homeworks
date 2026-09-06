terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

variable "vpc_cidr" {
  description = "CIDR VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR публичной подсети"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR приватной подсети"
  type        = string
}

variable "public_az" {
  description = "AZ публичной подсети"
  type        = string
}

variable "private_az" {
  description = "AZ приватной подсети"
  type        = string
}