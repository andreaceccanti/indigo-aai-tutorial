#!/bin/bash
set -e

dc=$(jq -r .device_code /tmp/device_code_response)

curl -s -L \
  -u ${IAM_DEVICE_CODE_CLIENT_ID}:${IAM_DEVICE_CODE_CLIENT_SECRET} \
  -d grant_type=urn:ietf:params:oauth:grant-type:device_code \
  -d device_code=${dc} ${IAM_TOKEN_ENDPOINT} | tee /tmp/dc_end | jq .
