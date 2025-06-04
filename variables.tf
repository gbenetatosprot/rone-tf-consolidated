variable "firewalls" {
  type = map(object({
    hostname = string
    username = string
  }))
}

variable "panos_password" {
  type      = string
  sensitive = true
  default = "ProTEr@2024"
}
