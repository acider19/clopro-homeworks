resource "yandex_compute_instance" "nat" {
  name        = "nat-instance"
  zone        = var.zone
  platform_id = "standard-v1"

  resources {
    cores         = var.cpu
    core_fraction = var.core_fraction
    memory        = var.ram
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
      size     = var.disk_size
      type     = var.disk_type
    }
  }

  network_interface {
    subnet_id  = var.subnet_id
    ip_address = "192.168.10.254"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}
