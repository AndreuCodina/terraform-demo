### Introduction

You want to have a Terraform repository per project, deploying a shared Terraform code to several environments: development, staging and production.

Your company has decided to use Azure instead of Terraform Cloud to store de Terraform state, so you'll create only one Resource Group with a Storage Account to store the Terraform state of all the projects in all environments. You'll use a container for each project and configure backups for the Storage Account.

### Nomenclatures

- **Resource names:**
    - **Azure:**
    `{resource_type}-{application}-{environment}-{location}-{sequential_number}`
    
    or in Terraform code

    `${local.resource_type.app_service}-${local.project}-${terraform.workspace}-${local.location.north_europe.geo_code}-001`

    - **Terraform:**
    `{application}_{location}_{sequential_number}`.

    `{application}` can be a compound name splitted by hyphens to have unique resource names in the subscription.

    Example:

    ```terraform
    resource "azurerm_service_plan" "myproj_001" {
        name = "asp-myproj-dev-ne-001"
        ...
    }

    resource "azurerm_linux_web_app" "backend_001" {
        name = "app-backend-dev-ne-001"
        ...
    }

    resource "azurerm_linux_web_app" "frontend_001" {
        name = "app-frontend-dev-ne-001"
        ...
    }
    ```

- **Roles:** `{who}_with_{role_name}_in_{resource}`. Example:

    ```terraform
    resource "azurerm_role_assignment" "backend_001_with_key_vault_administrator_in_kv_myproj_001" {
        scope                = azurerm_key_vault.myproj_001.id
        role_definition_name = "Key Vault Secrets User"
        principal_id         = azurerm_linux_web_app.backend_001.identity[0].principal_id
    }
    ```

### Create the Azure resources for Terraform

`myproj` is the project name.

- Create a Resource Group to store the Terraform state (e.g. `rg-terraform-prod-ne-001`).

- Create a Storage Account (e.g. `stterraformprodne001`) with Zone-Redundant Storage redundancy, and soft delete for containers and blobs.

- Create a container (e.g. `myproj-tfstate`).

### Configure backups for the Terraform state

- Create a Backup Vault (e.g. `bvault-terraform-prod-ne-001`).

- In the Storage Account, assign the role `Storage Account Backup Contributor` to the Backup Vault.

- In the Backup Vault, Create a Backup Vault Policy (e.g. `bkpol-terraform-st-prod-ne-001`).

- In the Backup Vault, create a backup, specifying the Backup Vault Policy and the Storage Account as data source.

### Setup the Service Principal for Terraform for a project

- Create a Resource Group per environment.

- Create a Service Principal (e.g. `sp-myproj-terraform-001`) to execute Terraform in the project.

- In the Azure Portal, create the Resource Groups (e.g. `rg-myproj-dev-ne-001`).

- To the Service Principal, assign the roles `Contributor`, and `User Access Administrator` to the Resource Groups with the condition "Allow user to assign all roles except privileged administrator roles Owner, UAA, RBAC (Recommended)".

- To the Service Principal, assign the role `Contributor` to the Storage Account where the Terraform state is stored.

    > **Note:** Don't worry if some resource (like AKS) creates automatically another Resource Group. When you delete the resource in Terraform, the Resource Group will be deleted automatically.

- To use the Service Principal, create a client secret for the Service Principal.

### Import existing resources to Terraform

You can use a data source

```terraform
data "azurerm_resource_group" "myproj_001" {
  name = "rg-myproj-prod-ne-001"
}
```

or import the resources manually (https://www.youtube.com/watch?v=znfh_00EDZ0).

```bash
import {
  to = azurerm_resource_group.myproj_001
  id = "/subscriptions/111-1111-111111-111/resourceGroups/rg-myproj-prod-ne-001"
}

terraform plan \
    -input=false \
    -out main.tfplan \
    -generate-config-out="generated.tf"
```

### Execute Terraform

```bash
terraform init

terraform fmt

terraform validate

terraform workspace select -or-create=true $TERRAFORM_WORKSPACE

terraform plan -input=false -out main.tfplan

terraform apply -auto-approve main.tfplan
```