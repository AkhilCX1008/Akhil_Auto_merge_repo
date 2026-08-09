variable "rg_name" {}
variable "vnets" {}
variable "subnets" {}
variable "vms" {}
variable "nic_ids" {
  type = map(any)
}
variable "pips" {}