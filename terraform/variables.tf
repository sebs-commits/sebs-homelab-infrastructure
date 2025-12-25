variable "proxmox_endpoint" {
  description = "Proxmox API endpoint"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "vms" {
  description = "Map of VMs to create"
  type = map(object({
    vmid       = number
    cores      = number
    memory     = number
    disk_size  = number
    ip_address = string
    gateway    = string
    node_name  = optional(string, "pve1")
    tags       = optional(list(string), [])
    
    # Template identifier for VM cloning
    template_id = optional(string, "local-lvm:vm-9000-disk-0")
    
    # this is for optional GPU passthrough (mainly for my jellyfin server)
    gpu_passthrough = optional(bool, false)
    gpu_device_id   = optional(string)
  }))
}

variable "default_user" {
  description = "Default VM user"
  type        = string
  default     = "sebdavid"
}

variable "default_password" {
  description = "Default VM password"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
}