# output "ct_addresses" {
#   value = flatten(module.lxc-proxmox[*].mac_addresses)
# }

# output "ct_hostname" {
#   value = module.lxc-proxmox[*].hostname
# }

output "host-mac" {
  value = [
    for idx, host in module.lxc-proxmox :
    "${host.hostname} - ${host.mac_addresses[0]}"
  ]

}
