output "internal_ip" {
  description = "Внутренний IP NAT-инстанса"
  value       = yandex_compute_instance.nat.network_interface.0.ip_address
}

output "nat_instance_id" {
  description = "ID NAT-инстанса"
  value       = yandex_compute_instance.nat.id
}