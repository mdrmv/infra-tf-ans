# Operations

Run Terraform from `compute-infra-dev` as the `infra-ops` user.

## Required Local Files

These files must exist on the control node and must not be committed:

```text
~/.config/yandex-cloud/sa-terraform-infra-key.json
terraform/envs/<environment>/backend.hcl
terraform/envs/<environment>/terraform.tfvars
```

## Standard Terraform Flow

```bash
cd terraform/envs/finance-stage
terraform init -backend-config=backend.hcl
terraform fmt
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
```

## Secret Handling

S3 credentials are written directly to Lockbox by the Terraform provider. Keep Terraform state in the protected remote backend anyway: state still contains infrastructure metadata and must never be committed.
