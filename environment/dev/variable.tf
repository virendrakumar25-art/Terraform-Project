variable "rgs" {}
variable "vnets" {}
variable "subnets" {}
variable "pips" {}
variable "vms" {}
variable "bastions" {
  default = {}
}
variable "win_vms" {
  default = {}
}
variable "lbs" {
  default = {}
}
variable "appgws" {
  default = {}
}
variable "key_vaults" {
  default = {}
}