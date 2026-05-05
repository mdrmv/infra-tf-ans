# Terraform

Terraform is split into reusable modules and environment roots.

```text
modules/
  object-storage/

envs/
  finance-stage/
```

Each environment root owns its own state file and backend configuration.

Do not commit:

- `terraform.tfvars`
- `backend.hcl`
- `*.tfstate`
- `tfplan`
