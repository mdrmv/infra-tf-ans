# Architecture

The target platform is Yandex Cloud KZ. The organization has one cloud and five folders:

- `infra`
- `global-stage`
- `global-internal`
- `finance-stage`
- `finance-internal`

The `infra` folder already contains the manually managed `compute-infra-dev` host, VPC `infra0`, and security group `default-sg-dbpfg58v0sila3obg6lu`. This host is used as the control node for Terraform and Ansible.

## Current Increment

The first managed resource group is Object Storage for `finance-stage`:

- `ngdem-finance-stage-private`
- `ngdem-finance-stage-public`
- `sa-finance-stage-s3`
- one static S3 access key
- one Lockbox secret containing the S3 key pair

The same pattern will later be reused for:

- `finance-internal`
- `global-stage`
- `global-internal`

## State

Terraform state must be stored remotely in Object Storage. The local `backend.hcl` file is intentionally ignored by Git because backend credentials must not be committed.
