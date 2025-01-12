output "mac_addresses" {
  value = proxmox_lxc.containers.network[*].hwaddr
}

output "hostname" {
  value = proxmox_lxc.containers.hostname
}

