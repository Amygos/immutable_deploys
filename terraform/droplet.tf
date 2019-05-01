resource "digitalocean_droplet" "app" {
  image  = "${data.digitalocean_image.app.image}"
  count  = "${var.instance_count}"
  name   = "app-${count.index}-${terraform.workspace}"
  region = "ams3"
  size   = "s-1vcpu-1gb"

  user_data = "${data.template_cloudinit_config.app.rendered}"
  tags      = ["${digitalocean_tag.app.id}"]
  ssh_keys  = ["${data.digitalocean_ssh_key.app.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

data "digitalocean_ssh_key" "app" {
  name = "Example"
}

resource "digitalocean_tag" "app" {
  name = "app-${terraform.workspace}"
}

resource "digitalocean_floating_ip" "app" {
  count      = "${var.instance_count > 1 ? 0 : 1}"
  droplet_id = "${digitalocean_droplet.app.id}"
  region     = "ams3"
}
