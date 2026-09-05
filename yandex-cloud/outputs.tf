output "public_instance_public_ip" {
  description = "Публичный IP виртуалки в public-подсети"
  value       = module.public_instance.public_ip
}

output "public_instance_private_ip" {
  description = "Приватный IP виртуалки в public-подсети (бастион)"
  value       = module.public_instance.private_ip
}

output "private_instance_private_ip" {
  description = "Приватный IP виртуалки в private-подсети"
  value       = module.private_instance.private_ip
}

output "nat_internal_ip" {
  description = "Внутренний IP NAT-инстанса"
  value       = module.nat.internal_ip
}