resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "eip-nat-15"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "nat-15"
  }

  depends_on = [var.igw_id]
}

resource "aws_route" "private_to_nat" {
  route_table_id         = var.private_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}