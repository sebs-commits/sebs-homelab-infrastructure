provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = true 
}

module "vms" {
  for_each = var.vms
  
  source = "./modules/proxmox-vm"
  
  node_name  = each.value.node_name
  vmid       = each.value.vmid
  cores      = each.value.cores
  memory     = each.value.memory
  disk_size  = each.value.disk_size
  ip_address = each.value.ip_address
  gateway    = each.value.gateway
  tags       = each.value.tags
  
  user      = var.default_user
  password  = var.default_password
  ssh_key   = var.ssh_public_key
  
  # Optional GPU passthrough (for my jellyfin server might need to tweak this later)
  gpu_passthrough = try(each.value.gpu_passthrough, false)
  gpu_device_id   = try(each.value.gpu_device_id, null)
}