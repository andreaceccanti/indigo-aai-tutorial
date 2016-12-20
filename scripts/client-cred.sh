#!/bin/bash
set -e

IAM_CLIENT_ID=${IAM_CLIENT_ID:-iam-client}
IAM_CLIENT_SECRET=${IAM_CLIENT_SECRET} 

IAM_TOKEN_ENDPOINT=${IAM_TOKEN_ENDPOINT:-https://iam.local.io/token}

if [[ -z "${IAM_CLIENT_SECRET}" ]]; then
  echo "Please provide a client secret setting the IAM_CLIENT_SECRET env variable."
  exit 1;
fi

curl -s -L \
  --user ${IAM_CLIENT_ID}:${IAM_CLIENT_SECRET} \
  -d grant_type=client_credentials \
  -d scope="" \
  ${IAM_TOKEN_ENDPOINT} | tee /tmp/response | jq .
