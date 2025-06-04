variable "firewalls" {
  type = map(object({
    hostname = string
    username = string
  }))
  default = {
    fw1 = {
      hostname = "52.203.138.190"
      username = "admin"
    },
    fw2 = {
      hostname = "3.215.31.89"
      username = "admin"
    }
  }
}

variable "panos_password" {
  type      = string
  sensitive = true
  default   = "ProTEr@2024"
}
