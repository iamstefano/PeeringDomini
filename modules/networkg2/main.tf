# Create virtual network
resource "azurerm_virtual_network" "myterraformnetwork2" {
  name                = var.vnet_name2
  address_space       = ["10.20.0.0/16"]
  location            = var.resource_group_location2
  resource_group_name = var.resource_group_name2
}

# Create subnet
resource "azurerm_subnet" "myterraformsubnet" {
  name                 = "mySubnetg2"
  resource_group_name  = var.resource_group_name2
  virtual_network_name = azurerm_virtual_network.myterraformnetwork2.name
  address_prefixes     = ["10.20.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
  name                = "myPublicIP2"
  location            = var.resource_group_location2
  resource_group_name = var.resource_group_name2
  allocation_method   = "Static"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
  name                = "myNetworkSecurityGroup2"
  location            = var.resource_group_location2
  resource_group_name = var.resource_group_name2

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
  name                = "myNIC2"
  location            = var.resource_group_location2
  resource_group_name = var.resource_group_name2

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

