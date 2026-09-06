data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "this" {
  name        = var.name
  zone        = var.zone
  platform_id = "standard-v1"

  resources {
    cores         = var.cpu
    core_fraction = var.core_fraction
    memory        = var.ram
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.disk_size
      type     = var.disk_type
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.assign_public_ip
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}
