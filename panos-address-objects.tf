# ---------- FW1 ----------

resource "panos_address_object" "fw1_objects" {
  for_each = local.address_objects
  provider = panos.fw1

  name        = each.key
  value       = each.value.value
  description = each.value.description
}

resource "panos_address_group" "fw1_group" {
  provider = panos.fw1

  name        = "RFC-1918"
  description = "RFC-1918"

  static_addresses = [
    for k in local.static_address_names :
    panos_address_object.fw1_objects[k].name
  ]

  depends_on = [panos_address_object.fw1_objects]

  lifecycle {
    create_before_destroy = true
  }
}

# ---------- FW2 ----------

resource "panos_address_object" "fw2_objects" {
  for_each = local.address_objects
  provider = panos.fw2

  name        = each.key
  value       = each.value.value
  description = each.value.description
}

resource "panos_address_group" "fw2_group" {
  provider = panos.fw2

  name        = "RFC-1918"
  description = "RFC-1918"

  static_addresses = [
    for k in local.static_address_names :
    panos_address_object.fw2_objects[k].name
  ]

  depends_on = [panos_address_object.fw2_objects]

  lifecycle {
    create_before_destroy = true
  }
}
