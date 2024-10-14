resource "libvirt_domain" "private_vm" {
  name   = "private-vm"
  memory = var.memory
  vcpu   = var.vcpu

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  # Connect to a private isolated network
  network_interface {
    network_name = libvirt_network.private_network.name
  }

  graphics {
    type = "spice"
    listen_type = "none"
  }
}
