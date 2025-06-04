locals {
  address_objects = {
    "rfc-1918-a" = {
      value       = "192.168.0.0/16"
      description = "192.168.0.0/16"
    },
    "rfc-1918-b" = {
      value       = "172.16.0.0/12"
      description = "172.16.0.0/12"
    },
    "rfc-1918-c" = {
      value       = "10.0.0.0/8"
      description = "10.0.0.0/8"
    }
  }

  static_address_names = keys(local.address_objects)
}
