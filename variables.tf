variable "id" {
  description = "Interface ID. Allowed format: `1/1`."
  type        = string

  validation {
    condition     = can(regex("^[0-9\\/]*$", var.id))
    error_message = "Allowed characters: `0`-`9`, `/`."
  }
}

variable "access_vlan" {
  description = "Native VLAN. Minimum value: 1. Maximum value: 3967."
  type        = number
  default     = 1

  validation {
    condition     = try(var.access_vlan >= 1 && var.access_vlan <= 3967, false)
    error_message = "Minimum value: 1. Maximum value: 3967."
  }
}

variable "admin_state" {
  description = "Administrative port state. Set `true` for `up` or `false` for `down`."
  type        = bool
  default     = true
}

variable "auto_negotiation" {
  description = "Administrative port auto-negotiation. Choices: `on`, `off`, `25G`."
  type        = string
  default     = "on"

  validation {
    condition     = contains(["on", "off", "25G"], var.auto_negotiation)
    error_message = "Valid values are `on`, `off` or `disabled`."
  }
}

variable "bandwidth" {
  description = "The bandwidth parameter for a routed interface, port channel, or subinterface. Minimum value: 0. Maximum value: 100000000."
  type        = number
  default     = 0

  validation {
    condition     = try(var.bandwidth >= 0 && var.bandwidth <= 100000000, false)
    error_message = "Minimum value: 0. Maximum value: 100000000."
  }
}

variable "delay" {
  description = "The administrative port delay time. Minimum value: 1. Maximum value: 16777215."
  type        = number
  default     = 1

  validation {
    condition     = try(var.delay >= 1 && var.delay <= 16777215, false)
    error_message = "Minimum value: 1. Maximum value: 16777215."
  }
}

variable "description" {
  description = "Interface description."
  type        = string
  default     = ""

  validation {
    condition     = can(regex("^.{0,254}$", var.description))
    error_message = " Maximum characters: 254."
  }
}

variable "duplex" {
  description = "Interface mode. Choices: `auto`, `full`, `half`."
  type        = string
  default     = "auto"

  validation {
    condition     = contains(["auto", "full", "half"], var.duplex)
    error_message = "Valid values are `auto`, `full` or `half`."
  }
}

variable "fec_mode" {
  description = "FEC mode. Choices: `fc-fec`, `rs-fec`, `fec-off`, `auto`, `rs-ieee`, `rs-cons16`, `kp-fec`."
  type        = string
  default     = "auto"

  validation {
    condition     = contains(["fc-fec", "rs-fec", "fec-off", "auto", "rs-ieee", "rs-cons16", "kp-fec"], var.fec_mode)
    error_message = "Valid values are `fc-fec`, `rs-fec`, `fec-off`, `auto`, `rs-ieee`, `rs-cons16` or `kp-fec`."
  }
}

variable "layer3" {
  description = "Administrative port layer."
  type        = bool
  default     = false
}

variable "link_debounce_down" {
  description = "Link debounce time. Minimum value: 0. Maximum value: 20000."
  type        = number
  default     = 100

  validation {
    condition     = try(var.link_debounce_down >= 0 && var.link_debounce_down <= 20000, false)
    error_message = "Minimum value: 0. Maximum value: 20000."
  }
}

variable "link_debounce_up" {
  description = "Link debounce time - link-up event. Minimum value: 0. Maximum value: 20000."
  type        = number
  default     = 0

  validation {
    condition     = try(var.link_debounce_up >= 0 && var.link_debounce_up <= 20000, false)
    error_message = "Minimum value: 0. Maximum value: 20000."
  }
}

variable "link_logging" {
  description = "FEC mode. Choices: `default`, `enable`, `disable`."
  type        = string
  default     = "default"

  validation {
    condition     = contains(["default", "enable", "disable"], var.link_logging)
    error_message = "Valid values are `default`, `enable` or `disable`."
  }
}

variable "medium" {
  description = "Administrative port medium type."
  type        = string
  default     = "broadcast"

  validation {
    condition     = contains(["broadcast", "p2p"], var.medium)
    error_message = "Valid values are `broadcast` or `p2p`."
  }
}

variable "mode" {
  description = "Interface mode. Choices: `access`, `trunk`, `fex-fabric`, `dot1q-tunnel`, `promiscuous`, `host`, `trunk_secondary`, `trunk_promiscuous`, `vntag`."
  type        = string
  default     = "access"

  validation {
    condition     = contains(["access", "trunk", "fex-fabric", "dot1q-tunnel", "promiscuous", "host", "trunk_secondary", "trunk_promiscuous", "vntag"], var.mode)
    error_message = "Valid values are `access`, `trunk`, `fex-fabric`, `dot1q-tunnel`, `promiscuous`, `host`, `trunk_secondary`, `trunk_promiscuous` or `vntag`."
  }
}

variable "mtu" {
  description = "Administrative port MTU. Minimum value: 576. Maximum value: 9216."
  type        = number
  default     = 1500

  validation {
    condition     = try(var.mtu >= 576 && var.mtu <= 9216, false)
    error_message = "Minimum value: 576. Maximum value: 9216."
  }
}

variable "native_vlan" {
  description = "Native VLAN. Possible values are `unknown`, `vlan-XX` or `vxlan-XX`."
  type        = number
  default     = 1

  validation {
    condition     = try(var.native_vlan >= 1 && var.native_vlan <= 3967, false)
    error_message = "Minimum value: 1. Maximum value: 3967."
  }
}

variable "speed" {
  description = "Administrative port speed. Choices: `unknown`, `100M`, `1G`, `10G`, `40G`, `auto`, `auto 100M`, `auto 100M 1G`, `100G`, `25G`, `10M`, `50G`, `200G`, `400G`, `2.5G`, `5G`, `auto 2.5G 5G 10G`, `auto 100M 1G 2.5G 5G`."
  type        = string
  default     = "auto"

  validation {
    condition     = contains(["unknown", "100M", "1G", "10G", "40G", "auto", "auto 100M", "auto 100M 1G", "100G", "25G", "10M", "50G", "200G", "400G", "2.5G", "5G", "auto 2.5G 5G 10G", "auto 100M 1G 2.5G 5G"], var.speed)
    error_message = "Valid values are `unknown`, `100M`, `1G`, `10G`, `40G`, `auto`, `auto 100M`, `auto 100M 1G`, `100G`, `25G`, `10M`, `50G`, `200G`, `400G`, `2.5G`, `5G`, `auto 2.5G 5G 10G` or `auto 100M 1G 2.5G 5G`."
  }
}

variable "speed_group" {
  description = "Speed group. Choices: `unknown`, `1000`, `10000`, `40000`, `auto`, `25000`."
  type        = string
  default     = "auto"

  validation {
    condition     = contains(["unknown", "1000", "10000", "40000", "auto", "25000"], var.speed_group)
    error_message = "Valid values are `unknown`, `1000`, `10000`, `40000`, `auto` or `25000`."
  }
}

variable "trunk_vlans" {
  description = "List of trunk VLANs. Allowed format: `1-2,4-5,100`."
  type        = string
  default     = "1-4094"

  validation {
    condition     = can(regex("^[0-9,-]*$", var.trunk_vlans))
    error_message = "Allowed format: `1-2,4-5,100`."
  }
}

variable "uni_directional_ethernet" {
  description = "UDE (Uni-Directional Ethernet). Choices: `disable`, `send-only`, `receive-only`."
  type        = string
  default     = "disable"

  validation {
    condition     = contains(["disable", "send-only", "receive-only"], var.uni_directional_ethernet)
    error_message = "Valid values are `disable`, `send-only` or `receive-only`."
  }
}

variable "vrf" {
  description = "VRF Name."
  type        = string
  default     = "default"

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]{0,32}$", var.vrf))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `-`. Maximum characters: 32."
  }
}

variable "ip_unnumbered" {
  description = "IP unnumbered. Reference to interface must match first field in the output of show intf brief. Example: `lo1`."
  type        = string
  default     = "unspecified"

  validation {
    condition     = can(regex("^\\S+$", var.ip_unnumbered))
    error_message = "Whitespaces are not allowed."
  }
}

variable "urpf" {
  description = "URPF (unicast Reverse Path Forwarding). Choices: `disabled`, `strict`, `loose`, `loose-allow-default`, `strict-allow-vni-hosts`."
  type        = string
  default     = "disabled"

  validation {
    condition     = contains(["disabled", "strict", "loose", "loose-allow-default", "strict-allow-vni-hosts"], var.urpf)
    error_message = "Valid values are `disabled`, `strict`, `loose`, `loose-allow-default` or `strict-allow-vni-hosts`."
  }
}

variable "ipv4_address" {
  description = "Interface IPv4 address."
  type        = string
  default     = null

  validation {
    condition     = can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+\\/\\d+$", var.ipv4_address))
    error_message = "Allowed characters: `0`-`9`, `.`, `/`."
  }
}
