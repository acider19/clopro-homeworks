output "public_ip" {
  description = "Публичный IP (для бастиона)"
  value       = var.assign_public_ip ? aws_instance.this.public_ip : ""
}

output "private_ip" {
  description = "Приватный IP внутри VPC"
  value       = aws_instance.this.private_ip
}

output "instance_id" {
  description = "ID инстанса"
  value       = aws_instance.this.id
}