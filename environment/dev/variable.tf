variable "parent_rgs" {
  type = map(any)
}

variable "parent_vnets" {
  type = map(any)
}

variable "parent_subnets" {
  type = map(any)
}

variable "parent_pips" {
  type = map(any)
}

variable "parent_vms" {
  type = map(any)
}

variable "parent_bastions" {
  type    = map(any)
  default = {}
}

variable "parent_win_vms" {
  type    = map(any)
  default = {}
}

variable "parent_lbs" {
  type    = map(any)
  default = {}
}

variable "parent_appgws" {
  type    = map(any)
  default = {}
}

variable "parent_key_vaults" {
  type    = map(any)
  default = {}
}