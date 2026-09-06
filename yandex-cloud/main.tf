locals {
  ssh_public_key = file(var.ssh_public_key_path)
}

module "vpc" {
  source = "./modules/vpc"

  zone   = var.zone
  nat_ip = "192.168.10.254"
}

module "nat" {
  source = "./modules/nat"

  zone           = var.zone
  subnet_id      = module.vpc.public_subnet_id
  ssh_public_key = local.ssh_public_key
}

module "public_instance" {
  source = "./modules/instance"

  name             = "public-instance"
  zone             = var.zone
  subnet_id        = module.vpc.public_subnet_id
  ssh_public_key   = local.ssh_public_key
  assign_public_ip = true
}

module "private_instance" {
  source = "./modules/instance"

  name             = "private-instance"
  zone             = var.zone
  subnet_id        = module.vpc.private_subnet_id
  ssh_public_key   = local.ssh_public_key
  assign_public_ip = false
}