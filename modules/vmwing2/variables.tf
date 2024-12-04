variable "resource_group_name"{}
    
variable "resource_group_location" {}

variable "vm_name2" {}

variable "vm_size" {}

variable "vm_username2" {}

variable "vm_password2" {}

variable "os_disk_storage_account_type" {}

variable "image_publisher" {}

variable "image_offer" {}

variable "image_sku" {}

variable "image_version" {}

variable "network_interface_id" {
  description = "ID dell'interfaccia di rete"
  type        = string
}

variable "Domain_DNSName" {
  description = "FQDN for the Active Directory forest root domain"
  type        = string
  sensitive   = false
  default = "dom.it"
}

variable "netbios_name" {
  description = "NETBIOS name for the AD domain"
  type        = string
  sensitive   = false
  default = "dom"
}

variable "SafeModeAdministratorPassword" {
  description = "Password for AD Safe Mode recovery"
  type        = string
  sensitive   = true
  default     = "StefanoAre140488_"
}