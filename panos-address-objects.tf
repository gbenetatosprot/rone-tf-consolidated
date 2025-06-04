resource "panos_address_object" "rfc1918" {
  for_each = {
    for combo in flatten([
      for fw_key, fw in var.firewalls : [
        for obj_key, obj in local.address_objects : {
          key         = "${fw_key}_${obj_key}"
          fw_key      = fw_key
          obj_name    = obj_key
          value       = obj.value
          description = obj.description
        }
      ]
    ]) : combo.key => combo
  }

  provider = panos.${each.value.fw_key}

  name        = each.value.obj_name
  value       = each.value.value
  description = each.value.description

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_address_group" "rfc1918_group" {
  for_each = var.firewalls

  provider = panos.${each.key}

  name        = "RFC-1918"
  description = "RFC-1918"

  static_addresses = [
    "rfc-1918-a",
    "rfc-1918-b",
    "rfc-1918-c"
  ]

  lifecycle {
    create_before_destroy = true
  }
}
