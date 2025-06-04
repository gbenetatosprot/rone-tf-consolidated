# ------------------- FW1 -------------------

resource "panos_zone" "fw1_internal" {
  provider = panos.fw1

  name             = "rone-internal"
  mode             = "layer3"
  interfaces       = [panos_ethernet_interface.fw1_e3.name]
  enable_user_id   = true

  depends_on = [panos_ethernet_interface.fw1_e3]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_zone" "fw1_external" {
  provider = panos.fw1

  name             = "rone-external"
  mode             = "layer3"
  interfaces       = [panos_ethernet_interface.fw1_e2.name]
  enable_user_id   = true

  depends_on = [panos_ethernet_interface.fw1_e2]

  lifecycle {
    create_before_destroy = true
  }
}

# ------------------- FW2 -------------------

resource "panos_zone" "fw2_internal" {
  provider = panos.fw2

  name             = "rone-internal"
  mode             = "layer3"
  interfaces       = [panos_ethernet_interface.fw2_e3.name]
  enable_user_id   = true

  depends_on = [panos_ethernet_interface.fw2_e3]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_zone" "fw2_external" {
  provider = panos.fw2

  name             = "rone-external"
  mode             = "layer3"
  interfaces       = [panos_ethernet_interface.fw2_e2.name]
  enable_user_id   = true

  depends_on = [panos_ethernet_interface.fw2_e2]

  lifecycle {
    create_before_destroy = true
  }
}
