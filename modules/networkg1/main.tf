# Create virtual network
resource "azurerm_virtual_network" "myterraformnetwork1" {
  name                = var.vnet_name1
  address_space       = ["10.10.0.0/16"]
  location            = var.resource_group_location1
  resource_group_name = var.resource_group_name1
}

# Create subnet VMLinux
resource "azurerm_subnet" "myterraformsubnet" {
  name                 = "mySubnetg1"
  resource_group_name  = var.resource_group_name1
  virtual_network_name = azurerm_virtual_network.myterraformnetwork1.name
  address_prefixes     = ["10.10.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP1"
    location                     = var.resource_group_location1
    resource_group_name          = var.resource_group_name1
    allocation_method            = "Static"

}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
    name                = var.networksecuritygroup_name
    location            = var.resource_group_location1
    resource_group_name = var.resource_group_name1

    security_rule {
        name                       = "AllowRDP"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

}

# Create network interface
resource "azurerm_network_interface" "myterraformnic" {
  name                = var.netinterface_name
  location            = var.resource_group_location1
  resource_group_name = var.resource_group_name1

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = azurerm_subnet.myterraformsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.myterraformnic.id
  network_security_group_id = azurerm_network_security_group.myterraformnsg.id
}

