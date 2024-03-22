```bash
az login --service-principal --username $CLIENT_ID --password $CLIENT_SECRET --tenant $TENANT_ID
```

```bash
rm -r .terraform .terraform.lock.hcl terraform.tfstate .terraform.tfstate.lock.info terraform.tfstate.backup main.tfplan
```