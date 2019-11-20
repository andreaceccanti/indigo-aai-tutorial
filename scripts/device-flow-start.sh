#!/bin/bash
set -e

IAM_DEVICE_CODE_CLIENT_SCOPES=${IAM_DEVICE_CODE_CLIENT_SCOPES:-"openid profile email offline_access"}

curl -s -f -L \
  -u ${IAM_DEVICE_CODE_CLIENT_ID}:${IAM_DEVICE_CODE_CLIENT_SECRET} \
  -d client_id=${IAM_DEVICE_CODE_CLIENT_ID} \
  -d scope="${IAM_DEVICE_CODE_CLIENT_SCOPES}" \
  ${IAM_DEVICE_CODE_ENDPOINT} | tee /tmp/device_code_response | jq .
