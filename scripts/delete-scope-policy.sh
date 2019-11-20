#!/bin/bash

curl -s -X DELETE \
  -H "Content-type: application/json" \
  -H "Authorization: Bearer ${IAM_ACCESS_TOKEN}" \
  ${IAM_SCOPE_POLICIES_ENDPOINT}/$1
