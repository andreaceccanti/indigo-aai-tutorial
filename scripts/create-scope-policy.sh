#!/bin/bash
set -e

curl -f -L -X POST -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${IAM_ACCESS_TOKEN}" \
  -d @sp.json https://iam.local.io/iam/scope_policies
