resource "proxmox_virtual_environment_vm" "this" {
  node_name = var.node_name
  vm_id     = var.vmid
  
  agent {
    enabled = true
  }
  
  cpu {
    cores = var.cores
  }
  
  memory {
    dedicated = var.memory
  }
  
  disk {
    datastore_id = var.datastore_id
    file_id      = var.template_id
    interface    = "scsi0"
    size         = var.disk_size
  }
  
  network_device {
    bridge = var.network_bridge
  }
  
  # Cloud-init config
  initialization {
    datastore_id = var.cloudinit_datastore_id
    
    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }
    
    user_account {
      username = var.user
      password = var.password
      keys     = [var.ssh_key]
    }
    
    dns {
      servers = var.dns_servers
    }
  }
  
  dynamic "hostpci" {
    for_each = var.gpu_passthrough ? [1] : []
    
    content {
      device = var.gpu_device_id
      mdev   = "sriov"
      pcie   = true
    }
  }
  
  tags = var.tags
  
  started = true
}

resource "proxmox_virtual_environment_vm_ip_addresses" "this" {
  vm_id = proxmox_virtual_environment_vm.this.vm_id
  node_name = var.node_name
  
  depends_on = [proxmox_virtual_environment_vm.this]
}

output "ipv4_addresses" {
  value = proxmox_virtual_environment_vm_ip_addresses.this.ipv4_addresses
}