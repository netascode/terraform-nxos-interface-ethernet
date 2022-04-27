<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-nxos-interface-ethernet/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-nxos-interface-ethernet/actions/workflows/test.yml)

# Terraform NX-OS Ethernet Interface Module

Manages NX-OS Ethernet Interface

Model Documentation: [Link](https://developer.cisco.com/docs/cisco-nexus-3000-and-9000-series-nx-api-rest-sdk-user-guide-and-api-reference-release-9-3x/#!configuring-an-ethernet-interface)

## Examples

```hcl
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
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_nxos"></a> [nxos](#requirement\_nxos) | >= 0.3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nxos"></a> [nxos](#provider\_nxos) | >= 0.3.6 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_id"></a> [id](#input\_id) | Interface ID. Allowed format: `1/1`. | `string` | n/a | yes |
| <a name="input_access_vlan"></a> [access\_vlan](#input\_access\_vlan) | Native VLAN. Minimum value: 1. Maximum value: 3967. | `number` | `1` | no |
| <a name="input_admin_state"></a> [admin\_state](#input\_admin\_state) | Administrative port state. Set `true` for `up` or `false` for `down`. | `bool` | `true` | no |
| <a name="input_auto_negotiation"></a> [auto\_negotiation](#input\_auto\_negotiation) | Administrative port auto-negotiation. Choices: `on`, `off`, `25G`. | `string` | `"on"` | no |
| <a name="input_bandwidth"></a> [bandwidth](#input\_bandwidth) | Interface bandwidth. Minimum value: 0. Maximum value: 100000000. | `number` | `0` | no |
| <a name="input_delay"></a> [delay](#input\_delay) | The administrative port delay time. Minimum value: 1. Maximum value: 16777215. | `number` | `1` | no |
| <a name="input_description"></a> [description](#input\_description) | Interface description. | `string` | `""` | no |
| <a name="input_duplex"></a> [duplex](#input\_duplex) | Interface mode. Choices: `auto`, `full`, `half`. | `string` | `"auto"` | no |
| <a name="input_fec_mode"></a> [fec\_mode](#input\_fec\_mode) | FEC mode. Choices: `fc-fec`, `rs-fec`, `fec-off`, `auto`, `rs-ieee`, `rs-cons16`, `kp-fec`. | `string` | `"auto"` | no |
| <a name="input_layer3"></a> [layer3](#input\_layer3) | Administrative port layer. | `bool` | `false` | no |
| <a name="input_link_debounce_down"></a> [link\_debounce\_down](#input\_link\_debounce\_down) | Link debounce time. Minimum value: 0. Maximum value: 20000. | `number` | `100` | no |
| <a name="input_link_debounce_up"></a> [link\_debounce\_up](#input\_link\_debounce\_up) | Link debounce time - link-up event. Minimum value: 0. Maximum value: 20000. | `number` | `0` | no |
| <a name="input_link_logging"></a> [link\_logging](#input\_link\_logging) | FEC mode. Choices: `default`, `enable`, `disable`. | `string` | `"default"` | no |
| <a name="input_medium"></a> [medium](#input\_medium) | Administrative port medium type. | `string` | `"broadcast"` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Interface mode. Choices: `access`, `trunk`, `fex-fabric`, `dot1q-tunnel`, `promiscuous`, `host`, `trunk_secondary`, `trunk_promiscuous`, `vntag`. | `string` | `"access"` | no |
| <a name="input_mtu"></a> [mtu](#input\_mtu) | Administrative port MTU. Minimum value: 576. Maximum value: 9216. | `number` | `1500` | no |
| <a name="input_native_vlan"></a> [native\_vlan](#input\_native\_vlan) | Native VLAN. Possible values are `unknown`, `vlan-XX` or `vxlan-XX`. | `number` | `1` | no |
| <a name="input_speed"></a> [speed](#input\_speed) | Administrative port speed. Choices: `unknown`, `100M`, `1G`, `10G`, `40G`, `auto`, `auto 100M`, `auto 100M 1G`, `100G`, `25G`, `10M`, `50G`, `200G`, `400G`, `2.5G`, `5G`, `auto 2.5G 5G 10G`, `auto 100M 1G 2.5G 5G`. | `string` | `"auto"` | no |
| <a name="input_speed_group"></a> [speed\_group](#input\_speed\_group) | Speed group. Choices: `unknown`, `1000`, `10000`, `40000`, `auto`, `25000`. | `string` | `"auto"` | no |
| <a name="input_trunk_vlans"></a> [trunk\_vlans](#input\_trunk\_vlans) | List of trunk VLANs. Allowed format: `1-2,4-5,100`. | `string` | `"1-4094"` | no |
| <a name="input_uni_directional_ethernet"></a> [uni\_directional\_ethernet](#input\_uni\_directional\_ethernet) | UDE (Uni-Directional Ethernet). Choices: `disable`, `send-only`, `receive-only`. | `string` | `"disable"` | no |
| <a name="input_vrf"></a> [vrf](#input\_vrf) | VRF Name. | `string` | `"default"` | no |
| <a name="input_ip_unnumbered"></a> [ip\_unnumbered](#input\_ip\_unnumbered) | IP unnumbered. Reference to interface must match first field in the output of show intf brief. Example: `lo1`. | `string` | `"unspecified"` | no |
| <a name="input_urpf"></a> [urpf](#input\_urpf) | URPF (unicast Reverse Path Forwarding). Choices: `disabled`, `strict`, `loose`, `loose-allow-default`, `strict-allow-vni-hosts`. | `string` | `"disabled"` | no |
| <a name="input_ipv4_address"></a> [ipv4\_address](#input\_ipv4\_address) | Interface IPv4 address. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dn"></a> [dn](#output\_dn) | Distinguished name of the object. |

## Resources

| Name | Type |
|------|------|
| [nxos_ipv4_interface.ipv4If](https://registry.terraform.io/providers/netascode/nxos/latest/docs/resources/ipv4_interface) | resource |
| [nxos_ipv4_interface_address.ipv4Addr](https://registry.terraform.io/providers/netascode/nxos/latest/docs/resources/ipv4_interface_address) | resource |
| [nxos_physical_interface.l1PhysIf](https://registry.terraform.io/providers/netascode/nxos/latest/docs/resources/physical_interface) | resource |
| [nxos_physical_interface_vrf.nwRtVrfMbr](https://registry.terraform.io/providers/netascode/nxos/latest/docs/resources/physical_interface_vrf) | resource |
<!-- END_TF_DOCS -->