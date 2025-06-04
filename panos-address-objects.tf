# ==================== FW1 ====================
resource "panos_address_object" "fw1_rfc1918" {
  for_each = local.address_objects

  provider = panos.fw1

  name        = each.key
  value       = each.value.value
  description = each.value.description

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_address_group" "fw1_rfc1918_group" {
  provider = panos.fw1

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

# ==================== FW2 ====================
resource "panos_address_object" "fw2_rfc1918" {
  for_each = local.address_objects

  provider = panos.fw2

  name        = each.key
  value       = each.value.value
  description = each.value.description

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_address_group" "fw2_rfc1918_group" {
  provider = panos.fw2

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
