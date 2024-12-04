variable "resource_group_name1"{
    default = "g1-rg"
    description = "Nome gruppo risorse"
}

variable "resource_group_location1" {
    default = "italynorth"
    description = "Locazione del gruppo di risorse"
}

variable "resource_group_name2"{
    default = "g2-rg"
    description = "Nome gruppo risorse"
}

variable "resource_group_location2" {
    default = "northeurope"
    description = "Locazione del gruppo di risorse"
}

###FeatureFlags OFF
/* variable "create_linux_resources" {
  description = "Flag per creare risorse Linux"
  type        = bool
  default     = true
}

variable "create_windows_resources" {
  description = "Flag per creare risorse Windows"
  type        = bool
  default     = true
} */

/*NETWORKwin*/

variable "vnet_name1" {
    default = "Vnet1"
    description = "Nome Vnet"

}

variable "vnet_name2" {
    default = "Vnet2"
    description = "Nome Vnet"

}

variable "pip_name" {
    default = "PublicIp"
    description = "Indirizzo IP pubblico"
}

variable "subnet_name" {
  default = "saSubnet"
  description = "Nome subnet"
}

variable "networksecuritygroup_name" {
  default = "saNetSecGroup"
  description = "Nome gruppo sicurezza network"
}

variable "netinterface_name" {
  default = "saNetInterface"
  description = "Nome interfaccia network"
}


/*VMwin*/

variable "vm_name1" {
  default = "vm1"
  description = "Nome VM"
}

variable "vm_name2" {
  default = "vm2"
  description = "Nome VM"
}

variable "vm_size" {
  default = "Standard_D2s_v3"
  description = "Modello size della VM"
}

variable "vm_username1" {
  default = "stefanostefano"
  description = "Username VM1"
}

variable "vm_password1" {
  default = "StefanoAre140488_"
  description = "Password VM1"
}

variable "vm_username2" {
  default = "stefanostefano"
  description = "Username VM2"
}

variable "vm_password2" {
  default = "StefanoAre140488_"
  description = "Password VM2"
}

variable "os_disk_storage_account_type" {
  default = "Standard_LRS"
  description = "Tipo storage disk VM"
}

variable "image_publisher" {
  default = "MicrosoftWindowsServer"
  description = "Publisher immagine"
}
variable "image_offer" {
  default = "WindowsServer"
  description = "Tipo di immagine"
}
variable "image_sku" {
  default = "2016-Datacenter"
  description = "Sku immagine"
}
variable "image_version" {
  default = "latest"
  description = "Versione immagine"
}


