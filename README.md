# NGDEM Infrastructure

Production infrastructure repository for migration from DigitalOcean to Yandex Cloud KZ.

The repository is intentionally rebuilt around small, isolated increments. The first active increment is Object Storage for `finance-stage`: two buckets, one S3 service account, one static access key, and Lockbox storage for the generated credentials.

## Active Scope

- Terraform manages Yandex Cloud resources.
- Ansible will manage OS/runtime configuration later.
- Existing manually configured monitoring is preserved under `legacy/` and is not managed by Terraform or Ansible at this stage.
- React build and deploy are out of scope for the current migration step.

## Layout

```text
terraform/
  modules/
    object-storage/
  envs/
    finance-stage/

ansible/
  inventories/
  playbooks/
  roles/

docs/
legacy/
scripts/
```

Start from [terraform/envs/finance-stage](terraform/envs/finance-stage).
