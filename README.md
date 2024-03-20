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