terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    nxos = {
      source  = "netascode/nxos"
      version = ">=0.3.7"
    }
  }
}

module "main" {
  source = "../.."

  id                 = "1/23"
  description        = "Terraform was here"
  layer3             = true
  link_debounce_down = 0
  mtu                = 9000
  ipv4_address       = "1.1.1.1/24"
  vrf                = "VRF1"
  urpf               = "loose"
}

data "nxos_physical_interface" "l1PhysIf" {
  interface_id = "eth1/23"

  depends_on = [module.main]
}

resource "test_assertions" "l1PhysIf" {
  component = "l1PhysIf"

  equal "interface_id" {
    description = "interface_id"
    got         = data.nxos_physical_interface.l1PhysIf.interface_id
    want        = "eth1/23"
  }

  equal "description" {
    description = "description"
    got         = data.nxos_physical_interface.l1PhysIf.description
    want        = "Terraform was here"
  }

  equal "layer" {
    description = "layer"
    got         = data.nxos_physical_interface.l1PhysIf.layer
    want        = "Layer3"
  }

  equal "link_debounce_down" {
    description = "link_debounce_down"
    got         = data.nxos_physical_interface.l1PhysIf.link_debounce_down
    want        = 0
  }

  equal "mtu" {
    description = "mtu"
    got         = data.nxos_physical_interface.l1PhysIf.mtu
    want        = 9000
  }
}

data "nxos_physical_interface_vrf" "nwRtVrfMbr" {
  interface_id = "eth1/23"

  depends_on = [module.main]
}

resource "test_assertions" "nwRtVrfMbr" {
  component = "nwRtVrfMbr"

  equal "interface_id" {
    description = "interface_id"
    got         = data.nxos_physical_interface_vrf.nwRtVrfMbr.interface_id
    want        = "eth1/23"
  }

  equal "vrf_dn" {
    description = "vrf_dn"
    got         = data.nxos_physical_interface_vrf.nwRtVrfMbr.vrf_dn
    want        = "sys/inst-VRF1"
  }
}

data "nxos_ipv4_interface" "ipv4If" {
  interface_id = "eth1/23"
  vrf          = "VRF1"

  depends_on = [module.main]
}

resource "test_assertions" "ipv4If" {
  component = "ipv4If"

  equal "interface_id" {
    description = "interface_id"
    got         = data.nxos_ipv4_interface.ipv4If.interface_id
    want        = "eth1/23"
  }

  equal "vrf" {
    description = "vrf"
    got         = data.nxos_ipv4_interface.ipv4If.vrf
    want        = "VRF1"
  }

  equal "urpf" {
    description = "urpf"
    got         = data.nxos_ipv4_interface.ipv4If.urpf
    want        = "loose"
  }
}

data "nxos_ipv4_interface_address" "ipv4Addr" {
  interface_id = "eth1/23"
  vrf          = "VRF1"
  address      = "1.1.1.1/24"

  depends_on = [module.main]
}

resource "test_assertions" "ipv4Addr" {
  component = "ipv4Addr"

  equal "interface_id" {
    description = "interface_id"
    got         = data.nxos_ipv4_interface_address.ipv4Addr.interface_id
    want        = "eth1/23"
  }

  equal "vrf" {
    description = "vrf"
    got         = data.nxos_ipv4_interface_address.ipv4Addr.vrf
    want        = "VRF1"
  }

  equal "address" {
    description = "address"
    got         = data.nxos_ipv4_interface_address.ipv4Addr.address
    want        = "1.1.1.1/24"
  }
}
