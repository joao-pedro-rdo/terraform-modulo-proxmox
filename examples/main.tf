terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "=2.9.14"
    }
  }
}
# Tambem pode usar com arquivo `provider.tf` separado
provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = var.pm_tls_insecure
}


# TODO testar se com IPV4 extatico da pra usar local exec


module "lxc-proxmox" {
  source         = "./modules/lxc-proxmox"
  target_node    = var.target_node
  bridge         = var.bridge
  ostemplate     = var.ostemplate
  lxc_password   = var.lxc_password
  storage        = var.storage
  lxc_containers = var.lxc_containers
  hostname       = "${var.hostname}-${count.index + 1}"
  unprivileged   = var.unprivileged
  nameserver     = var.dns
  count          = var.num_containers
  ssh-keys       = ["${file("~/.ssh/id_rsa.pub")}, ${file("~/.ssh/joao-ansible_rsa.pub")}"]





}
