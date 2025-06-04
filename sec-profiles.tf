# ================================================================
# FW1 - Security Profiles
# ================================================================

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
}

resource "panos_url_filtering_security_profile" "fw1_url_profile" {
  provider = panos.fw1
  depends_on = [
    panos_custom_url_category.fw1_msp_block,
    panos_custom_url_category.fw1_msp_allow,
    panos_custom_url_category.fw1_external_url
  ]

  name                     = "rone-deafult-content-category"
  description              = "rone-deafult-content-category"
  log_container_page_only = true
  block_categories         = ["adult","abortion","command-and-control","cryptocurrency","extremism","gambling","hacking","high-risk","malware","nudity","phishing","questionable","ransomware","sex-education","rone-external-url"]
  alert_categories         = ["unknown","medium-risk","parked","peer-to-peer","proxy-avoidance-and-anonymizers","real-time-detection","shareware-and-freeware"]
  allow_categories         = ["rone-msp-allow", "rone-msp-block"]
  ucd_mode                 = "disabled"
  ucd_log_severity         = "medium"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_security_profile_group" "fw1_sec_profile_inbound" {
  provider = panos.fw1
  name = "rone-ibound-spg"
  anti_spyware_profile   = panos_anti_spyware_security_profile.fw1_asp_profile.name
  vulnerability_profile  = panos_vulnerability_security_profile.fw1_vuln_profile.name

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_security_profile_group" "fw1_sec_profile_outbound" {
  provider = panos.fw1
  name = "rone-outbound-spg"
  anti_spyware_profile   = panos_anti_spyware_security_profile.fw1_asp_profile.name
  vulnerability_profile  = panos_vulnerability_security_profile.fw1_vuln_profile.name
  url_filtering_profile  = panos_url_filtering_security_profile.fw1_url_profile.name

  lifecycle {
    create_before_destroy = true
  }
}

# ================================================================
# FW2 - Security Profiles (Same Config as FW1)
# ================================================================

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
}

resource "panos_url_filtering_security_profile" "fw2_url_profile" {
  provider = panos.fw2
  depends_on = [
    panos_custom_url_category.fw2_msp_block,
    panos_custom_url_category.fw2_msp_allow,
    panos_custom_url_category.fw2_external_url
  ]

  name                     = "rone-deafult-content-category"
  description              = "rone-deafult-content-category"
  log_container_page_only = true
  block_categories         = ["adult","abortion","command-and-control","cryptocurrency","extremism","gambling","hacking","high-risk","malware","nudity","phishing","questionable","ransomware","sex-education","rone-external-url"]
  alert_categories         = ["unknown","medium-risk","parked","peer-to-peer","proxy-avoidance-and-anonymizers","real-time-detection","shareware-and-freeware"]
  allow_categories         = ["rone-msp-allow", "rone-msp-block"]
  ucd_mode                 = "disabled"
  ucd_log_severity         = "medium"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_security_profile_group" "fw2_sec_profile_inbound" {
  provider = panos.fw2
  name = "rone-ibound-spg"
  anti_spyware_profile   = panos_anti_spyware_security_profile.fw2_asp_profile.name
  vulnerability_profile  = panos_vulnerability_security_profile.fw2_vuln_profile.name

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_security_profile_group" "fw2_sec_profile_outbound" {
  provider = panos.fw2
  name = "rone-outbound-spg"
  anti_spyware_profile   = panos_anti_spyware_security_profile.fw2_asp_profile.name
  vulnerability_profile  = panos_vulnerability_security_profile.fw2_vuln_profile.name
  url_filtering_profile  = panos_url_filtering_security_profile.fw2_url_profile.name

  lifecycle {
    create_before_destroy = true
  }
}
