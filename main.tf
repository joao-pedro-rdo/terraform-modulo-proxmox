# Configuração do Terraform para o Proxmox Provider
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">2.5"
    }
  }
}

# provider "proxmox" {
#   pm_api_url      = var.pm_api_url
#   pm_user         = var.pm_user
#   pm_password     = var.pm_password
#   pm_tls_insecure = var.pm_tls_insecure
# }

# Criar múltiplos containers LXC dinamicamente
resource "proxmox_lxc" "containers" {
  target_node = var.target_node
  hostname    = var.hostname
  ostemplate  = var.ostemplate
  password    = var.lxc_password
  cores       = var.lxc_containers.cores
  memory      = var.lxc_containers.memory
  swap        = var.lxc_containers.swap


  rootfs {
    storage = var.storage
    size    = var.lxc_containers.disk_size
  }
  network {
    name   = "eth0"
    bridge = var.bridge
    ip     = var.lxc_containers.ip
  }
}
