#!/bin/bash
set -ex

source common.sh


if [[ -z "${IAM_CLIENT_AUDIENCE}" ]]; then

  curl -s -L \
    --user ${IAM_CLIENT_ID}:${IAM_CLIENT_SECRET} \
    -d grant_type=client_credentials \
    -d scope="${IAM_CLIENT_SCOPES}" \
    ${IAM_TOKEN_ENDPOINT} | tee /tmp/response | jq .

else 
  curl -s -L \
    --user ${IAM_CLIENT_ID}:${IAM_CLIENT_SECRET} \
    -d grant_type=client_credentials \
    -d scope="${IAM_CLIENT_SCOPES}" \
    -d audience="${IAM_CLIENT_AUDIENCE}" \
    ${IAM_TOKEN_ENDPOINT} | tee /tmp/response | jq .
fi
