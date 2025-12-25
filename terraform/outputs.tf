output "vm_ips" {
  description = "Map of VM names to IP addresses"
  value = {
    for name, vm in module.vms : name => vm.ipv4_addresses[0]
  }
}

output "vm_status" {
  description = "VM creation status"
  value = {
    for name, vm in module.vms : name => {
      id     = module.vms[name].vm_id
      ip     = module.vms[name].ipv4_addresses[0]
      status = "created"
    }
  }
}