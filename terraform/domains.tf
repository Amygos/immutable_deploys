resource "digitalocean_domain" "app" {
  name = "${terraform.workspace}.deploy.example.com"
}

resource "digitalocean_record" "app" {
  domain = "${digitalocean_domain.app.name}"
  type   = "A"
  name   = "app"
  ttl    = "60"

  value = "${var.instance_count > 1 ? 
		join(" ", digitalocean_loadbalancer.app.*.ip) :
		join(" ", digitalocean_floating_ip.app.*.ip_address)}"
}
