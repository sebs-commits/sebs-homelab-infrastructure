provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = true
  
# SSH Configuration needed to access VM's after creation
  ssh {
    username    = "root"
    private_key = file("/home/sebdavid/.ssh/id_ed25519")
  }
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
  
  # Template for VM cloning
  template_id = each.value.template_id
  
  user      = var.default_user
  password  = var.default_password
  ssh_key   = var.ssh_public_key
  
  # Optional GPU passthrough (for my jellyfin server might need to tweak this later)
  gpu_passthrough = try(each.value.gpu_passthrough, false)
  gpu_device_id   = try(each.value.gpu_device_id, null)
}