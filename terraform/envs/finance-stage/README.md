# finance-stage

This environment currently creates only the Object Storage pilot resources:

- `ngdem-finance-stage-private`
- `ngdem-finance-stage-public`
- `sa-finance-stage-s3`
- `finance-stage-s3-credentials` in Lockbox

## Prepare Local Files

Create local files from examples:

```bash
cp terraform.tfvars.example terraform.tfvars
cp backend.hcl.example backend.hcl
```

Fill in real values. Do not commit those files.

## Run

```bash
terraform init -backend-config=backend.hcl
terraform fmt
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
```

## Verify

```bash
terraform output
yc lockbox secret get finance-stage-s3-credentials
yc lockbox payload get finance-stage-s3-credentials
```

Use `https://storage.yandexcloud.kz` and region `kz1` for S3-compatible clients.
