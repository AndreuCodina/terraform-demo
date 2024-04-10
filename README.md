# Steps for a company with a Terraform repository per project

`prjo` is the project name.

- Create a resource group to store the Terraform state (e.g. `rg-tf-prod-ne-001`).

- Create a storage account (e.g. `sttfprodne001`).

- Create a container (e.g. `prjo-tfstate`).

- Create a service principal to execute Terraform in the project (e.g. `sp-tfprjo`).

- To the service principal, assign the role `Storage Blob Data Contributor` in the container where the Terraform state will be stored:

    ```bash
    az role assignment create \
        --assignee "<service_principal_id>" \
        --role "Storage Blob Data Contributor" \
        --scope "/subscriptions/<subscription_id>/resourceGroups/<resource_group>/providers/Microsoft.Storage/storageAccounts/<storage_account>/blobServices/default/containers/<container_name>"
    ```