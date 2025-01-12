# Configuração do Terraform para o Proxmox Provider
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9.14"
    }
  }
}

# Criar múltiplos containers LXC dinamicamente
resource "proxmox_lxc" "containers" {
  target_node  = var.target_node # nome do nó
  hostname     = var.hostname    # nome do container
  ostemplate   = var.ostemplate  # template do container
  password     = var.lxc_password
  cores        = var.lxc_containers.cores
  memory       = var.lxc_containers.memory
  swap         = var.lxc_containers.swap
  unprivileged = var.unprivileged
  tags         = var.tag
  nameserver   = var.nameserver
  searchdomain = var.searchdomain

  onboot          = true # Ligar no boot
  start           = true # Iniciar o container apos a criação
  ssh_public_keys = join("\n", var.ssh-keys)


  rootfs {
    storage = var.storage
    size    = var.lxc_containers.disk_size
  }
  network {
    name   = "eth0"
    bridge = var.bridge
    ip     = var.lxc_containers.ip
  }

  features {
    fuse    = var.fuse
    nesting = var.nesting
  }
}
