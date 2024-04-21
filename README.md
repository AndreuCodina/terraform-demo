### Introduction

You want to have a Terraform repository per project, deploying a shared Terraform code to several environments: development, staging and production.

Your company has decided to use Azure instead of Terraform Cloud to store de Terraform state, so you'll create only one Resource Group with a Storage Account to store the Terraform state of all the projects in all environments. You'll use a container for each project and configure backups for the Storage Account.

### Create the Azure resources

`prjo` is the project name.

- Create a Resource Group to store the Terraform state (e.g. `rg-tf-prod-ne-001`).

- Create a Storage Account (e.g. `sttfprodne001`) with Zone-Redundant Storage redundancy, and soft delete for containers and blobs.

- Create a container (e.g. `prjo-tfstate`).

### Setup the Service Principal for Terraform for a project

- Create a Service Principal to execute Terraform in the project (e.g. `sp-tfprjo`).

- Create a resource group.

- To the Service Principal, assign the role `User Access Administrator` to the resource group with the condition "Allow user to assign all roles except privileged administrator roles Owner, UAA, RBAC (Recommended)".

<!-- - Create resource groups (e.g. rg-prjo-dev-ne-001 and rg-prjo-prod-ne-001) -->
<!-- - To the service principal, assign the role `Owner` in the RG, so it can assign roles ??? -->
<!-- Test: Create AKS and delete it, so we can check if the SP can delete the resource group automatically when Terraform deletes the AKS resource -->
<!-- prevent service principal delete other resource groups terraform -->
<!-- Puedo proporcionar un scope a RBAC que aún no existe? Me refiero al resource group que tendría que crear Terraform -->

- To the Service Principal, assign the role `Storage Blob Data Contributor` in the container where the Terraform state will be stored. You can use the Azure Portal or this command:

    ```bash
    az role assignment create \
        --assignee "<service_principal_id>" \
        --role "Storage Blob Data Contributor" \
        --scope "/subscriptions/<subscription_id>/resourceGroups/<resource_group>/providers/Microsoft.Storage/storageAccounts/<storage_account>/blobServices/default/containers/<container_name>"
    ```

### Configure backups for the Terraform state

- Create a Backup Vault (e.g. `bvault-tf-prod-ne-001`).
- In the Storage Account, assign the role `Storage Account Backup Contributor` to the Backup Vault.
- In the Backup Vault, Create a Backup Vault Policy (e.g. `bkpol-sttf-prod-ne-001`).
- In the Backup Vault, create a backup, specifying the Backup Vault Policy and the Storage Account as data source.

### Nomenclatures

- **Resource names:**
    - **Azure:**
    `{resource_type}-{application}-{environment}-{location}-{sequential_number}`.

    - **Terraform:**
    `{application}_{location}_{sequential_number}`.

    `{application}` can be a compound name splitted by hyphens to have unique resource names in the subscription.

    Example:

    ```terraform
    resource "azurerm_service_plan" "prjo_ne_001" {
        name = "asp-prjo-dev-ne-001"
        ...
    }

    resource "azurerm_linux_web_app" "backend_prjo_ne_001" {
        name = "app-backend-prjo-dev-ne-001"
        ...
    }

    resource "azurerm_linux_web_app" "frontend_prjo_ne_001" {
        name = "app-backend-prjo-dev-ne-001"
        ...
    }
    ```

- **Roles:** `{who}_with_{role_name}`. Example:

    ```terraform
    resource "azurerm_role_assignment" "backend_prjo_ne_001_with_key_vault_administrator" {
        scope                = azurerm_key_vault.prjo_ne_001.id
        role_definition_name = "Key Vault Administrator"
        principal_id         = azurerm_linux_web_app.backend_prjo_ne_001.identity[0].principal_id
    }
    ```

### Import existing resource to Terraform

`terraform import`