resource "libvirt_domain" "bastion" {
  name   = "bastion-vm"
  memory = 512  # 512MB of RAM
  vcpu   = 1    # 1 CPU

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  # Connect to the public network (NAT)
  network_interface {
    network_name = libvirt_network.public_network.name
  }

  # Add console configuration for serial access
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  # Optionally, configure a graphics device if you want remote desktop (SPICE)
  graphics {
    type = "spice"
    listen_type = "none"
  }
}
