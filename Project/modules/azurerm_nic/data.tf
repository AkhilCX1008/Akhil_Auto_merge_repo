
data "azurerm_network_interface" "nic" {
  for_each            = var.nic_ids
  name                = each.value.name
  resource_group_name = each.value.rg_name
}
data "azurerm_subnet" "subnets" {
  for_each             = var.nic_ids
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.rg_name
}