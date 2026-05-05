#!/usr/bin/env bash
set -euo pipefail

environment="${1:?Usage: scripts/terraform-plan.sh <environment>}"
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tf_dir="${repo_root}/terraform/envs/${environment}"

if [[ ! -d "${tf_dir}" ]]; then
  echo "Unknown Terraform environment: ${environment}" >&2
  exit 1
fi

terraform -chdir="${tf_dir}" init -backend-config=backend.hcl
terraform -chdir="${tf_dir}" fmt
terraform -chdir="${tf_dir}" validate
terraform -chdir="${tf_dir}" plan -out=tfplan
