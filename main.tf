terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker",
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "my_tf_container" {
  image = docker_image.my_nginx_image.latest
  name  = "my_terraform_nginx_container"
  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_image" "my_nginx_image" {
  name = "nginx:latest"
}
