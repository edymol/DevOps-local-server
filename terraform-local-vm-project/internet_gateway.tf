resource "libvirt_network" "public_network" {
  name   = "public-network"
  mode   = "nat"
  domain = "local"

  addresses = [var.public_network_cidr]  # Use variable
}
