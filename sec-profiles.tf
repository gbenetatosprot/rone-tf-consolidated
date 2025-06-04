######################################
# FW1 Security Profiles
######################################

data "panos_system_info" "fw1" {
  provider = panos.fw1
}

resource "panos_anti_spyware_security_profile" "fw1_asp_profile" {
  provider    = panos.fw1
  name        = "rone-asp"
  description = "rone-asp"

  rule {
    name           = "simple-critical"
    threat_name    = "any"
    category       = "any"
    action         = "drop"
    packet_capture = "extended-capture"
    severities     = ["critical"]
  }

  rule {
    name           = "simple-high"
    threat_name    = "any"
    category       = "any"
    action         = "drop"
    packet_capture = "extended-capture"
    severities     = ["high"]
  }

  rule {
    name           = "simple-medium"
    threat_name    = "any"
    category       = "any"
    action         = "default"
    packet_capture = "single-packet"
    severities     = ["medium"]
  }

  rule {
    name           = "low"
    threat_name    = "any"
    category       = "any"
    action         = "alert"
    packet_capture = "disable"
    severities     = ["low"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_vulnerability_security_profile" "fw1_vuln_profile" {
  provider    = panos.fw1
  name        = "rone-vuln"
  description = "rone-vuln"

  rule {
    name           = "simple-client-critical"
    category       = "any"
    threat_name    = "any"
    action         = "drop"
    host           = "client"
    severities     = ["critical"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "extended-capture"
  }

  rule {
    name           = "simple-client-high"
    category       = "any"
    threat_name    = "any"
    action         = "drop"
    host           = "client"
    severities     = ["high"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "extended-capture"
  }

  rule {
    name           = "simple-client-medium"
    category       = "any"
    threat_name    = "any"
    action         = "default"
    host           = "client"
    severities     = ["medium"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "single-packet"
  }

  rule {
    name           = "simple-server-critical"
    category       = "any"
    threat_name    = "any"
    action         = "drop"
    host           = "server"
    severities     = ["critical"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "extended-capture"
  }

  rule {
    name           = "simple-server-high"
    category       = "any"
    threat_name    = "any"
    action         = "drop"
    host           = "server"
    severities     = ["high"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "extended-capture"
  }

  rule {
    name           = "simple-server-medium"
    category       = "any"
    threat_name    = "any"
    action         = "default"
    host           = "server"
    severities     = ["medium"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "single-packet"
  }

  lifecycle {
    create_before_destroy = true
  }
}

######################################
# FW2 Security Profiles
######################################

data "panos_system_info" "fw2" {
  provider = panos.fw2
}

resource "panos_anti_spyware_security_profile" "fw2_asp_profile" {
  provider    = panos.fw2
  name        = "rone-asp"
  description = "rone-asp"

  rule {
    name           = "simple-critical"
    threat_name    = "any"
    category       = "any"
    action         = "drop"
    packet_capture = "extended-capture"
    severities     = ["critical"]
  }

  rule {
    name           = "simple-high"
    threat_name    = "any"
    category       = "any"
    action         = "drop"
    packet_capture = "extended-capture"
    severities     = ["high"]
  }

  rule {
    name           = "simple-medium"
    threat_name    = "any"
    category       = "any"
    action         = "default"
    packet_capture = "single-packet"
    severities     = ["medium"]
  }

  rule {
    name           = "low"
    threat_name    = "any"
    category       = "any"
    action         = "alert"
    packet_capture = "disable"
    severities     = ["low"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_vulnerability_security_profile" "fw2_vuln_profile" {
  provider    = panos.fw2
  name        = "rone-vuln"
  description = "rone-vuln"

  rule {
    name           = "simple-client-critical"
    category       = "any"
    threat_name    = "any"
    action         = "drop"
    host           = "client"
    severities     = ["critical"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "extended-capture"
  }

  rule {
    name           = "simple-client-high"
    category       = "any"
    threat_name    = "any"
    action         = "drop"
    host           = "client"
    severities     = ["high"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "extended-capture"
  }

  rule {
    name           = "simple-client-medium"
    category       = "any"
    threat_name    = "any"
    action         = "default"
    host           = "client"
    severities     = ["medium"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "single-packet"
  }

  rule {
    name           = "simple-server-critical"
    category       = "any"
    threat_name    = "any"
    action         = "drop"
    host           = "server"
    severities     = ["critical"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "extended-capture"
  }

  rule {
    name           = "simple-server-high"
    category       = "any"
    threat_name    = "any"
    action         = "drop"
    host           = "server"
    severities     = ["high"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "extended-capture"
  }

  rule {
    name           = "simple-server-medium"
    category       = "any"
    threat_name    = "any"
    action         = "default"
    host           = "server"
    severities     = ["medium"]
    cves           = ["any"]
    vendor_ids     = ["any"]
    packet_capture = "single-packet"
  }

  lifecycle {
    create_before_destroy = true
  }
}
