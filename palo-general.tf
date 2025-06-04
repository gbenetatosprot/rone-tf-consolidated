# ---------- FW1 ----------
resource "panos_general_settings" "fw1" {
  provider    = panos.fw1
  hostname    = "Application-Firewall-1"
  dns_primary = "4.2.2.2"
  timezone    = "US/Eastern"

  lifecycle {
    create_before_destroy = true
  }
}

# ---------- FW2 ----------
resource "panos_general_settings" "fw2" {
  provider    = panos.fw2
  hostname    = "Application-Firewall-2"
  dns_primary = "4.2.2.2"
  timezone    = "US/Eastern"

  lifecycle {
    create_before_destroy = true
  }
}
