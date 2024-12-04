output "network_interface_id" {
  value = azurerm_network_interface.myterraformnic.id
}

output "vnet_name2" {
  value = azurerm_virtual_network.myterraformnetwork2.name
}

output "vnet_id2" {
  value = azurerm_virtual_network.myterraformnetwork2.id
}