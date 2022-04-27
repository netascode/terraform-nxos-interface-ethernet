locals {
  id = "eth${var.id}"
}

resource "nxos_physical_interface" "l1PhysIf" {
  device                   = var.device
  interface_id             = local.id
  fec_mode                 = var.fec_mode
  access_vlan              = var.layer3 ? "unknown" : "vlan-${var.access_vlan}"
  admin_state              = var.admin_state ? "up" : "down"
  auto_negotiation         = var.auto_negotiation
  bandwidth                = var.bandwidth
  delay                    = var.delay
  description              = var.description
  duplex                   = var.duplex
  layer                    = var.layer3 ? "Layer3" : "Layer2"
  link_debounce_up         = var.link_debounce_up
  link_debounce_down       = var.link_debounce_down
  link_logging             = var.link_logging
  medium                   = var.medium
  mode                     = var.mode
  mtu                      = var.mtu
  native_vlan              = var.layer3 ? "unknown" : "vlan-${var.native_vlan}"
  speed                    = var.speed
  speed_group              = var.speed_group
  trunk_vlans              = var.layer3 ? "1-4094" : var.trunk_vlans
  uni_directional_ethernet = var.uni_directional_ethernet
  user_configured_flags    = "admin_layer,admin_mtu,admin_state"
}

resource "nxos_physical_interface_vrf" "nwRtVrfMbr" {
  count        = var.layer3 ? 1 : 0
  device       = var.device
  interface_id = local.id
  vrf_dn       = "sys/inst-${var.vrf}"
  depends_on = [
    nxos_physical_interface.l1PhysIf
  ]
}

resource "nxos_ipv4_interface" "ipv4If" {
  count        = var.layer3 ? 1 : 0
  device       = var.device
  vrf          = var.vrf
  interface_id = local.id
  unnumbered   = var.ip_unnumbered
  urpf         = var.urpf
  depends_on = [
    nxos_physical_interface_vrf.nwRtVrfMbr
  ]
}

resource "nxos_ipv4_interface_address" "ipv4Addr" {
  count        = var.layer3 && var.ipv4_address != null ? 1 : 0
  device       = var.device
  vrf          = var.vrf
  interface_id = local.id
  address      = var.ipv4_address
  depends_on = [
    nxos_ipv4_interface.ipv4If
  ]
}
