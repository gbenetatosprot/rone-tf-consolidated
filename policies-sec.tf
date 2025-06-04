# ------------------- FW1 -------------------

resource "panos_security_policy" "fw1_allow_policies" {
  provider = panos.fw1

  depends_on = [
    panos_zone.fw1_internal,
    panos_zone.fw1_external
  ]

  rule {
    name                  = "allow-internet"
    audit_comment         = "allow-internet"
    source_zones          = [panos_zone.fw1_internal.name]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = [panos_zone.fw1_external.name]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
    group                 = panos_security_profile_group.fw1_sec_profile_outbound.name
  }

  rule {
    name                  = "allow-internal"
    audit_comment         = "allow-internal"
    source_zones          = [panos_zone.fw1_internal.name]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = [panos_zone.fw1_internal.name]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
    group                 = panos_security_profile_group.fw1_sec_profile_inbound.name
  }

  rule {
    name                  = "allow-internal-2"
    audit_comment         = "allow-internal-2"
    source_zones          = [panos_zone.fw1_internal.name]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = [panos_zone.fw1_internal.name]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
    group                 = panos_security_profile_group.fw1_sec_profile_inbound.name
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ------------------- FW2 -------------------

resource "panos_security_policy" "fw2_allow_policies" {
  provider = panos.fw2

  depends_on = [
    panos_zone.fw2_internal,
    panos_zone.fw2_external
  ]

  rule {
    name                  = "allow-internet"
    audit_comment         = "allow-internet"
    source_zones          = [panos_zone.fw2_internal.name]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = [panos_zone.fw2_external.name]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
    group                 = panos_security_profile_group.fw2_sec_profile_outbound.name
  }

  rule {
    name                  = "allow-internal"
    audit_comment         = "allow-internal"
    source_zones          = [panos_zone.fw2_internal.name]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = [panos_zone.fw2_internal.name]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
    group                 = panos_security_profile_group.fw2_sec_profile_inbound.name
  }

  rule {
    name                  = "allow-internal-2"
    audit_comment         = "allow-internal-2"
    source_zones          = [panos_zone.fw2_internal.name]
    source_addresses      = ["any"]
    source_users          = ["any"]
    destination_zones     = [panos_zone.fw2_internal.name]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
    group                 = panos_security_profile_group.fw2_sec_profile_inbound.name
  }

  lifecycle {
    create_before_destroy = true
  }
}
