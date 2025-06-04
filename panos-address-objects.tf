resource "panos_address_object" "rfc1918" {
  for_each = {
    for fw_key, fw in var.firewalls :
    for obj_key, obj in local.address_objects :
    "${fw_key}_${obj_key}" => {
      hostname    = fw.hostname
      username    = fw.username
      obj_name    = obj_key
      value       = obj.value
      description = obj.description
    }
  }

  name        = each.value.obj_name
  value       = each.value.value
  description = each.value.description
  hostname    = each.value.hostname
  username    = each.value.username
  password    = var.panos_password

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_address_group" "rfc1918_group" {
  for_each = var.firewalls

  name        = "RFC-1918"
  description = "RFC-1918"
  hostname    = each.value.hostname
  username    = each.value.username
  password    = var.panos_password

  static_addresses = [
    "rfc-1918-a",
    "rfc-1918-b",
    "rfc-1918-c"
  ]

  lifecycle {
    create_before_destroy = true
  }
}
