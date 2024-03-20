# Abbreviation examples for Azure resources

https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

# Geo-code list

https://learn.microsoft.com/en-us/azure/backup/scripts/geo-code-list

# Requirements

Terraform and Azure CLI run with the credentials of the service principal "terraform" with the next roles:

- Contributor

### Login to Azure

```bash
az login --service-principal --username $ARM_CLIENT_ID --password $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID
```

#### Remove local Terraform state

```bash
rm -r .terraform .terraform.lock.hcl terraform.tfstate .terraform.tfstate.lock.info terraform.tfstate.backup main.tfplan
```

#### Init Terraform providers

```bash
terraform init
```

#### Format Terraform files

```bash
terraform fmt
```

#### Validate configuration files

```bash
terraform validate
```

#### Plan Terraform deployment

```bash
terraform plan -out main.tfplan
```

#### Destroy Terraform resources

```bash
# terraform plan -out main.tfplan -destroy
```

#### Apply Terraform deployment

```bash
terraform apply -auto-approve main.tfplan
```