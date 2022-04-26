module "nxos_interface_ethernet" {
  source  = "netascode/interface-ethernet/nxos"
  version = ">= 0.0.1"

  id                 = "1/23"
  description        = "Terraform was here"
  layer3             = true
  link_debounce_down = 0
  mtu                = 9000
  ipv4_address       = "1.1.1.1/24"
  vrf                = "VRF1"
  urpf               = "loose"
}
