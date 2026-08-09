output "vnets" {
  value = {
    for k, v in azurerm_virtual_network.vents : k => v.id
  }
}