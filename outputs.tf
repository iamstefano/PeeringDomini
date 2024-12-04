output "windows_vm_ip1" {
  value       =  module.vmwing1.public_ip_address
  description = "Indirizzo IP della macchina virtuale Windows g1"
}

output "windows_vm_ip2" {
  value       = module.vmwing2.public_ip_address
  description = "Indirizzo IP della macchina virtuale Windows g2"
}

