output "nat_gateway_id" {
  description = "ID NAT Gateway"
  value       = aws_nat_gateway.this.id
}

output "nat_public_ip" {
  description = "Публичный IP NAT Gateway (EIP)"
  value       = aws_eip.nat.public_ip
}