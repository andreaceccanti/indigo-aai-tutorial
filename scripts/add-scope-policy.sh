#!/bin/bash

curl -vvv -X POST \
  -H "Content-type: application/json" \
  -H "Authorization: Bearer ${IAM_ACCESS_TOKEN}" \
  ${IAM_SCOPE_POLICIES_ENDPOINT} --data "@$1"
