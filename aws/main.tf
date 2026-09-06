locals {
  ssh_public_key = file(var.ssh_public_key_path)
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  public_az           = var.public_az
  private_az          = var.private_az
}

resource "aws_key_pair" "deploy" {
  key_name   = var.key_name
  public_key = local.ssh_public_key
}

resource "aws_security_group" "this" {
  name        = "15"
  description = "SSH_ICMP"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "nat" {
  source = "./modules/nat"

  public_subnet_id       = module.vpc.public_subnet_id
  private_route_table_id = module.vpc.private_route_table_id
  igw_id                 = module.vpc.igw_id
}

module "bastion" {
  source = "./modules/instance"

  name              = "bastion"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = aws_security_group.this.id
  key_name          = aws_key_pair.deploy.key_name
  instance_type     = var.instance_type
  assign_public_ip  = true
}

module "private" {
  source = "./modules/instance"

  name              = "private"
  subnet_id         = module.vpc.private_subnet_id
  security_group_id = aws_security_group.this.id
  key_name          = aws_key_pair.deploy.key_name
  instance_type     = var.instance_type
  assign_public_ip  = false
}
