output "vm_id" {
  description = "The ID of the created VM"
  value       = proxmox_virtual_environment_vm.this.vm_id
}

output "ipv4_addresses" {
  description = "IPv4 addresses assigned to the VM"
  value       = proxmox_virtual_environment_vm.this.ipv4_addresses
}

output "mac_addresses" {
  description = "MAC addresses of the VM network interfaces"
  value       = proxmox_virtual_environment_vm.this.mac_addresses
}

output "node_name" {
  description = "Proxmox node where the VM is running"
  value       = proxmox_virtual_environment_vm.this.node_name
}