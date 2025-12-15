variable "node_name" {
  description = "Proxmox node name"
  type        = string
}

variable "vmid" {
  description = "VM ID"
  type        = number
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory in MB"
  type        = number
  default     = 4096
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 32
}

variable "ip_address" {
  description = "IP address with CIDR"
  type        = string
}

variable "gateway" {
  description = "Default gateway"
  type        = string
}

variable "user" {
  description = "Default user"
  type        = string
  default     = "sebdavid"
}

variable "password" {
  description = "User password"
  type        = string
  sensitive   = true
}

variable "ssh_key" {
  description = "SSH public key"
  type        = string
}

variable "datastore_id" {
  description = "Storage for VM disks"
  type        = string
  default     = "local-lvm"
}

variable "template_id" {
  description = "Template VM ID"
  type        = number
  default     = 9000
}

variable "cloudinit_datastore_id" {
  description = "Storage for cloud-init"
  type        = string
  default     = "local-lvm"
}

variable "network_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "dns_servers" {
  description = "DNS servers"
  type        = list(string)
  default     = ["1.1.1.1", "8.8.8.8"]
}

variable "gpu_passthrough" {
  description = "Enable GPU passthrough"
  type        = bool
  default     = false
}

variable "gpu_device_id" {
  description = "GPU device ID for passthrough"
  type        = string
  default     = null
}

variable "tags" {
  description = "VM tags"
  type        = list(string)
  default     = []
}