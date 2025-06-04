terraform {
  required_providers {
    panos = {
      source  = "PaloAltoNetworks/panos"
      version = "1.11.1"
    }
  }
}

provider "panos" {
  alias              = "fw1"
  hostname           = var.firewalls["fw1"].hostname
  username           = var.firewalls["fw1"].username
  password           = var.panos_password
  verify_certificate = false
}

provider "panos" {
  alias              = "fw2"
  hostname           = var.firewalls["fw2"].hostname
  username           = var.firewalls["fw2"].username
  password           = var.panos_password
  verify_certificate = false
}
