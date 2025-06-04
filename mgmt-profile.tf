# ------------------- FW1 -------------------
resource "panos_management_profile" "fw1_mgmt_profile" {
  provider = panos.fw1

  name  = "imp-https-ping"
  https = true
  ping  = true

  lifecycle {
    create_before_destroy = true
  }
}

# ------------------- FW2 -------------------
resource "panos_management_profile" "fw2_mgmt_profile" {
  provider = panos.fw2

  name  = "imp-https-ping"
  https = true
  ping  = true

  lifecycle {
    create_before_destroy = true
  }
}
