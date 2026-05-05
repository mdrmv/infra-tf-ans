# Migration Plan

## Step 1: Object Storage Pilot

Create `finance-stage` Object Storage resources in Yandex Cloud KZ:

- private bucket
- public bucket
- S3 service account
- static access key
- Lockbox secret for credentials

This validates:

- Terraform access to YC KZ;
- folder permissions;
- remote state;
- bucket naming;
- Lockbox usage;
- S3-compatible endpoint behavior.

## Later Steps

After the pilot is verified:

- repeat Object Storage for the remaining test folders;
- migrate data from DigitalOcean Spaces;
- add PostgreSQL resources;
- add compute resources;
- add Ansible bootstrap/runtime configuration.
