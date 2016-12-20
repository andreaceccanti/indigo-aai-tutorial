#!/bin/bash
set -e
at=$(cat /tmp/response | jq -r .access_token)

echo "export IAM_ACCESS_TOKEN=\"${at}\""
