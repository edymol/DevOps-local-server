resource "libvirt_network" "private_network" {
  name   = "private-network"
  mode   = "none"
  domain = "local"

  addresses = [var.private_network_cidr]  # Use variable
}
