# VM Linux

Progetto esempio di creazione di un'infrastruttura cloud con Terraform e Azure e VM con SO Windows e UbuntuServer.

## Terraform

Scaricabile nel sito ufficiale [Terraform](https://developer.hashicorp.com/terraform/install?product_intent=terraform) in base al proprio sistema operativo.

## Comandi principali progetto

```bash
# inizializzazione terraform
terraform init

# creazione piano di esecuzione terraform
terraform plan

# applicazione del piano
terraform apply

# cancellazione infrastruttura
terraform destroy
```

## Variabili (tabella esempio per readme)

| Nome                       | Default       | Descrizione                                                                                                      |
| -------------------------- | ------------- | ---------------------------------------------------------------------------------------------------------------- |
| resource_group_name_prefix | rg            | Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription. |
| resource_group_location    | northeurope   | Location of the resource group.                                                                                  |
| vm_image_size              | Standard_B2ms | Image size for location of the resource group.                                                                   |

---

## Output

- indirizzo Ip pubblico
- ssh private key
- ssh public key

## Altre info

Inizializzare Terraform
terraform init
Creare un piano di esecuzione Terraform
terraform plan -out main.tfplan
Verificare e correggere eventuali errori
Applicare un piano di esecuzione terraform
terraform apply main.tfplan
############################################################

#Indirizzo ip pubblico#

- terraform output public_ip_address
  #Chiave privata
- terraform output -raw tls_private_key > id_rsa.pem # id_rsa.pem
- chmod 400 id_rsa
  #Usare SSH per connettersi alla macchina virtuale
- ssh -i id_rsa vmname@<public_ip_address>
  ############################################################

##terraform destroy

ssh -i ./id_rsa.pem saVMLinux@ip-pubblico
