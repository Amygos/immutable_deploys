data "template_cloudinit_config" "app" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.config_app.rendered}"
  }
}

data "template_file" "config_app" {
  template = "${file("${path.module}/config_app.tpl")}"

  vars {
    db_host     = "${digitalocean_database_cluster.app.host}"
    db_port     = "${digitalocean_database_cluster.app.port}"
    db_user     = "${digitalocean_database_cluster.app.user}"
    db_password = "${digitalocean_database_cluster.app.password}"
    db_name     = "${digitalocean_database_cluster.app.database}"
  }
}
