#!/usr/bin/env bash
set -euo pipefail

environment="${1:?Usage: scripts/terraform-apply.sh <environment>}"
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tf_dir="${repo_root}/terraform/envs/${environment}"

if [[ ! -f "${tf_dir}/tfplan" ]]; then
  echo "Missing plan file: ${tf_dir}/tfplan" >&2
  echo "Run scripts/terraform-plan.sh ${environment} first." >&2
  exit 1
fi

terraform -chdir="${tf_dir}" apply tfplan
