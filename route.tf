# ------------------- FW1 -------------------

data "panos_virtual_router" "fw1_default" {
  provider = panos.fw1
  name     = "default"
}

resource "panos_virtual_router_entry" "fw1_add_if" {
  provider         = panos.fw1
  virtual_router   = data.panos_virtual_router.fw1_default.name
  interface        = panos_ethernet_interface.fw1_e2.name

  depends_on = [panos_ethernet_interface.fw1_e2]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_virtual_router_entry" "fw1_add_internal" {
  provider         = panos.fw1
  virtual_router   = data.panos_virtual_router.fw1_default.name
  interface        = panos_ethernet_interface.fw1_e3.name

  depends_on = [panos_ethernet_interface.fw1_e3]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_static_route_ipv4" "fw1_default" {
  provider         = panos.fw1
  name             = "Default"
  virtual_router   = data.panos_virtual_router.fw1_default.name
  destination      = "0.0.0.0/0"
  next_hop         = "10.39.0.129"
  interface        = "ethernet1/2"

  depends_on = [panos_virtual_router_entry.fw1_add_if]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_static_route_ipv4" "fw1_rfc_a" {
  provider         = panos.fw1
  name             = "rfc-a"
  virtual_router   = data.panos_virtual_router.fw1_default.name
  destination      = "192.168.0.0/16"
  next_hop         = "10.39.0.17"
  interface        = "ethernet1/3"

  depends_on = [panos_virtual_router_entry.fw1_add_internal]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_static_route_ipv4" "fw1_rfc_b" {
  provider         = panos.fw1
  name             = "rfc-b"
  virtual_router   = data.panos_virtual_router.fw1_default.name
  destination      = "172.16.0.0/12"
  next_hop         = "10.39.0.17"
  interface        = "ethernet1/3"

  depends_on = [panos_virtual_router_entry.fw1_add_internal]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_static_route_ipv4" "fw1_rfc_c" {
  provider         = panos.fw1
  name             = "rfc-c"
  virtual_router   = data.panos_virtual_router.fw1_default.name
  destination      = "10.0.0.0/8"
  next_hop         = "10.39.0.17"
  interface        = "ethernet1/3"

  depends_on = [panos_virtual_router_entry.fw1_add_internal]

  lifecycle {
    create_before_destroy = true
  }
}

# ------------------- FW2 -------------------

data "panos_virtual_router" "fw2_default" {
  provider = panos.fw2
  name     = "default"
}

resource "panos_virtual_router_entry" "fw2_add_if" {
  provider         = panos.fw2
  virtual_router   = data.panos_virtual_router.fw2_default.name
  interface        = panos_ethernet_interface.fw2_e2.name

  depends_on = [panos_ethernet_interface.fw2_e2]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_virtual_router_entry" "fw2_add_internal" {
  provider         = panos.fw2
  virtual_router   = data.panos_virtual_router.fw2_default.name
  interface        = panos_ethernet_interface.fw2_e3.name

  depends_on = [panos_ethernet_interface.fw2_e3]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_static_route_ipv4" "fw2_default" {
  provider         = panos.fw2
  name             = "Default"
  virtual_router   = data.panos_virtual_router.fw2_default.name
  destination      = "0.0.0.0/0"
  next_hop         = "10.39.0.129"
  interface        = "ethernet1/2"

  depends_on = [panos_virtual_router_entry.fw2_add_if]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_static_route_ipv4" "fw2_rfc_a" {
  provider         = panos.fw2
  name             = "rfc-a"
  virtual_router   = data.panos_virtual_router.fw2_default.name
  destination      = "192.168.0.0/16"
  next_hop         = "10.39.0.17"
  interface        = "ethernet1/3"

  depends_on = [panos_virtual_router_entry.fw2_add_internal]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_static_route_ipv4" "fw2_rfc_b" {
  provider         = panos.fw2
  name             = "rfc-b"
  virtual_router   = data.panos_virtual_router.fw2_default.name
  destination      = "172.16.0.0/12"
  next_hop         = "10.39.0.17"
  interface        = "ethernet1/3"

  depends_on = [panos_virtual_router_entry.fw2_add_internal]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_static_route_ipv4" "fw2_rfc_c" {
  provider         = panos.fw2
  name             = "rfc-c"
  virtual_router   = data.panos_virtual_router.fw2_default.name
  destination      = "10.0.0.0/8"
  next_hop         = "10.39.0.17"
  interface        = "ethernet1/3"

  depends_on = [panos_virtual_router_entry.fw2_add_internal]

  lifecycle {
    create_before_destroy = true
  }
}
