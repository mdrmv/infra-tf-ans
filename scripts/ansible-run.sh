#!/usr/bin/env bash
set -euo pipefail

environment="${1:?Usage: scripts/ansible-run.sh <environment> <playbook>}"
playbook="${2:?Usage: scripts/ansible-run.sh <environment> <playbook>}"
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

ansible-playbook \
  -i "${repo_root}/ansible/inventories/${environment}/hosts.yml" \
  "${repo_root}/ansible/playbooks/${playbook}.yml"
