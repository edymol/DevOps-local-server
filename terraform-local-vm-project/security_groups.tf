resource "libvirt_cloudinit_disk" "commoninit" {
  name = "cloud-init.iso"
  user_data = <<EOF
#cloud-config
ssh_authorized_keys:
  - ${file("~/.ssh/id_rsa.pub")}
runcmd:
  - ufw allow 22/tcp  # SSH
  - ufw allow 80/tcp  # HTTP
  - ufw allow 443/tcp # HTTPS
  - ufw enable
EOF

  lifecycle {
    prevent_destroy = false  # Prevent Terraform from destroying/recreating this disk
    ignore_changes  = [user_data]  # Ignore changes to user_data
  }
}
