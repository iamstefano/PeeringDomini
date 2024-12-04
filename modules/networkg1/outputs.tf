output "public_ip_address" {
  value = azurerm_public_ip.myterraformpublicip.ip_address
}

output "network_interface_id" {
  value = azurerm_network_interface.myterraformnic.id
}

output "vnet_name1" {
  value = azurerm_virtual_network.myterraformnetwork1.name
}

output "vnet_id1" {
  value = azurerm_virtual_network.myterraformnetwork1.id
}