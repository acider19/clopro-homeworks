output "public_subnet_id" {
  description = "ID публичной подсети"
  value       = yandex_vpc_subnet.public.id
}

output "private_subnet_id" {
  description = "ID приватной подсети"
  value       = yandex_vpc_subnet.private.id
}

output "vpc_id" {
  description = "ID сети"
  value       = yandex_vpc_network.this.id
}