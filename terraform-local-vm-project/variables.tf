variable "local_ip" {
  description = "Your local IP address for SSH access"
  type        = string
}

variable "memory" {
  description = "Memory for the virtual machines (in MB)"
  default     = 1024
}

variable "vcpu" {
  description = "Number of vCPUs for the virtual machines"
  default     = 1
}

variable "vm_name" {
  description = "Name of the virtual machine"
  default     = "local-vm"
}

variable "public_network_cidr" {
  description = "CIDR block for the public network"
  default     = "192.168.100.0/24"
}

variable "private_network_cidr" {
  description = "CIDR block for the private network"
  default     = "192.168.101.0/24"
}
