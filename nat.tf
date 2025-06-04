# ------------------- FW1 -------------------

resource "panos_nat_rule" "fw1_nat_to_internet" {
  provider = panos.fw1

  name                  = "Nat-To-Internet"
  source_zones          = [panos_zone.fw1_internal.name]
  destination_zone      = panos_zone.fw1_external.name
  source_addresses      = ["any"]
  destination_addresses = ["any"]

  sat_type              = "dynamic-ip-and-port"
  sat_address_type      = "interface-address"
  sat_interface         = panos_ethernet_interface.fw1_e2.name

  lifecycle {
    create_before_destroy = true
  }
}

# ------------------- FW2 -------------------

resource "panos_nat_rule" "fw2_nat_to_internet" {
  provider = panos.fw2

  name                  = "Nat-To-Internet"
  source_zones          = [panos_zone.fw2_internal.name]
  destination_zone      = panos_zone.fw2_external.name
  source_addresses      = ["any"]
  destination_addresses = ["any"]

  sat_type              = "dynamic-ip-and-port"
  sat_address_type      = "interface-address"
  sat_interface         = panos_ethernet_interface.fw2_e2.name

  lifecycle {
    create_before_destroy = true
  }
}
