resource "digitalocean_loadbalancer" "app" {
  name   = "app-${terraform.workspace}"
  region = "ams3"
  count  = "${var.instance_count > 1 ? 1 : 0}"

  forwarding_rule {
    entry_port     = 8080
    entry_protocol = "tcp"

    target_port     = 8080
    target_protocol = "tcp"
  }

  healthcheck {
    port     = 8080
    protocol = "tcp"
  }

  droplet_tag = "${digitalocean_tag.app.id}"
}
