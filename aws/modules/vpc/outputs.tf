output "igw_id" {
  description = "ID Internet Gateway"
  value       = aws_internet_gateway.this.id
}

output "vpc_id" {
  description = "ID VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_id" {
  description = "ID публичной подсети"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID приватной подсети"
  value       = aws_subnet.private.id
}

output "private_route_table_id" {
  description = "ID route table приватной подсети (для маршрута от NAT)"
  value       = aws_route_table.private.id
}