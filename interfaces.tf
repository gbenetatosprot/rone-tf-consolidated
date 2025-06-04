# ------------------- FW1 -------------------

resource "panos_ethernet_interface" "fw1_e2" {
  provider                  = panos.fw1
  name                      = "ethernet1/2"
  comment                   = "rone-external"
  vsys                      = "vsys1"
  mode                      = "layer3"
  enable_dhcp               = true
  create_dhcp_default_route = false
  management_profile        = panos_management_profile.fw1_mgmt_profile.name

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_ethernet_interface" "fw1_e3" {
  provider                  = panos.fw1
  name                      = "ethernet1/3"
  comment                   = "rone-internal"
  vsys                      = "vsys1"
  mode                      = "layer3"
  enable_dhcp               = true
  create_dhcp_default_route = false
  management_profile        = panos_management_profile.fw1_mgmt_profile.name

  lifecycle {
    create_before_destroy = true
  }
}

# ------------------- FW2 -------------------

resource "panos_ethernet_interface" "fw2_e2" {
  provider                  = panos.fw2
  name                      = "ethernet1/2"
  comment                   = "rone-external"
  vsys                      = "vsys1"
  mode                      = "layer3"
  enable_dhcp               = true
  create_dhcp_default_route = false
  management_profile        = panos_management_profile.fw2_mgmt_profile.name

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_ethernet_interface" "fw2_e3" {
  provider                  = panos.fw2
  name                      = "ethernet1/3"
  comment                   = "rone-internal"
  vsys                      = "vsys1"
  mode                      = "layer3"
  enable_dhcp               = true
  create_dhcp_default_route = false
  management_profile        = panos_management_profile.fw2_mgmt_profile.name

  lifecycle {
    create_before_destroy = true
  }
}
