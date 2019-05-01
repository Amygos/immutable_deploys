resource "digitalocean_database_cluster" "app" {
  name       = "app-${terraform.workspace}"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "ams3"
  node_count = 1
}
