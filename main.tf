# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.10.0"
    }
  }
}
provider "azurerm" {
 features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
  subscription_id= "3fbf8c25-42c1-4347-b310-6642844443e8"

}

resource "azurerm_resource_group" "myterraformgroup1" {
  name     = var.resource_group_name1
  location = var.resource_group_location1
}

resource "azurerm_resource_group" "myterraformgroup2" {
  name     = var.resource_group_name2
  location = var.resource_group_location2
}

module "networkg1" {
    source = "./modules/networkg1"
    /* count  = var.create_windows_resources ? 1 : 0 */
    resource_group_name1 = var.resource_group_name1          
    resource_group_location1 = var.resource_group_location1 
    vnet_name1 = var.vnet_name1 
    pip_name = var.pip_name
    subnet_name = var.subnet_name
    networksecuritygroup_name = var.networksecuritygroup_name
    netinterface_name = var.netinterface_name
    depends_on = [azurerm_resource_group.myterraformgroup1] 
}

module "networkg2" {
    source = "./modules/networkg2"
    /* count  = var.create_linux_resources ? 1 : 0 */
    resource_group_name2 = var.resource_group_name2          
    resource_group_location2 = var.resource_group_location2 
    vnet_name2 = var.vnet_name2 
    pip_name = var.pip_name
    subnet_name = var.subnet_name
    networksecuritygroup_name = var.networksecuritygroup_name
    netinterface_name = var.netinterface_name
    depends_on = [azurerm_resource_group.myterraformgroup2]
}
 

module "vmwing1" {
    source = "./modules/vmwing1"
    /* count  = var.create_windows_resources ? 1 : 0 */
    resource_group_name = var.resource_group_name1          
    resource_group_location = var.resource_group_location1  
    vm_name1 = var.vm_name1
    vm_size = var.vm_size
    vm_username1 = var.vm_username1
    vm_password1 = var.vm_password1
    os_disk_storage_account_type = var.os_disk_storage_account_type
    image_publisher = var.image_publisher
    image_offer = var.image_offer
    image_sku = var.image_sku
    image_version = var.image_version
    network_interface_id = module.networkg1.network_interface_id
    depends_on = [module.networkg1] 
}

module "vmwing2" {
    source = "./modules/vmwing2"
    /* count  = var.create_linux_resources ? 1 : 0 */
    resource_group_name = var.resource_group_name2          
    resource_group_location = var.resource_group_location2   
    vm_name2 = var.vm_name2
    vm_size = var.vm_size
    vm_username2 = var.vm_username2
    vm_password2 = var.vm_password2
    os_disk_storage_account_type = var.os_disk_storage_account_type
    image_publisher = var.image_publisher
    image_offer = var.image_offer
    image_sku = var.image_sku
    image_version = var.image_version
    network_interface_id = module.networkg2.network_interface_id
    depends_on = [module.networkg2] 
}

resource "azurerm_virtual_network_peering" "myterraformnetwork1" {
  name                      = "peer-g1-to-g2"
  resource_group_name       = var.resource_group_name1
  virtual_network_name      = module.networkg1.vnet_name1
  remote_virtual_network_id = module.networkg2.vnet_id2
}

resource "azurerm_virtual_network_peering" "myterraformnetwork2" {
  name                      = "peer-g2-to-g1"
  resource_group_name       = var.resource_group_name2
  virtual_network_name      = module.networkg2.vnet_name2
  remote_virtual_network_id = module.networkg1.vnet_id1
}

