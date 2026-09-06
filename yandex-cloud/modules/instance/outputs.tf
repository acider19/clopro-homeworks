output "public_ip" {
  description = "Публичный IP (если назначен)"
  value       = try(yandex_compute_instance.this.network_interface.0.nat_ip_address, "")
}

output "private_ip" {
  description = "Внутренний IP"
  value       = yandex_compute_instance.this.network_interface.0.ip_address
}

output "instance_id" {
  description = "ID виртуалки"
  value       = yandex_compute_instance.this.id
}