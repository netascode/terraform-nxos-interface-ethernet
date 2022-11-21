terraform {
  required_version = ">= 1.0.0"

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

  id = "1/23"
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

  equal "admin_state" {
    description = "admin_state"
    got         = data.nxos_physical_interface.l1PhysIf.admin_state
    want        = "up"
  }
}
