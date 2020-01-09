#!/bin/bash
set -e

IAM_CLIENT_ID=${IAM_CLIENT_ID:-iam-client}
IAM_CLIENT_SECRET=${IAM_CLIENT_SECRET} 

IAM_TOKEN_ENDPOINT=${IAM_TOKEN_ENDPOINT:-https://iam.local.io/token}
IAM_CLIENT_SCOPES=${IAM_CLIENT_SCOPES:-"openid profile offline_access"}
IAM_CLIENT_AUDIENCE=${IAM_CLIENT_AUDIENCE}

if [[ -z "${IAM_CLIENT_SECRET}" ]]; then
  echo "Please provide a client secret setting the IAM_CLIENT_SECRET env variable."
  exit 1;
fi

if [[ -z "${IAM_SUBJECT_TOKEN}" ]]; then
  echo "Please provide a subject token to exchange setting the IAM_SUBJECT_TOKEN env variable."
  exit 1;
fi

if [[ -z "${IAM_CLIENT_AUDIENCE}" ]]; then
  curl -s -L \
    --user ${IAM_CLIENT_ID}:${IAM_CLIENT_SECRET} \
    -d grant_type=urn:ietf:params:oauth:grant-type:token-exchange \
    -d scope=${IAM_CLIENT_SCOPES} \
    -d subject_token=${IAM_SUBJECT_TOKEN} \
    ${IAM_TOKEN_ENDPOINT} | tee /tmp/response | jq .
else 
  curl -s -L \
    --user ${IAM_CLIENT_ID}:${IAM_CLIENT_SECRET} \
    -d grant_type=urn:ietf:params:oauth:grant-type:token-exchange \
    -d scope=${IAM_CLIENT_SCOPES} \
    -d audience=${IAM_CLIENT_AUDIENCE} \
    -d subject_token=${IAM_SUBJECT_TOKEN} \
    ${IAM_TOKEN_ENDPOINT} | tee /tmp/response | jq .
fi
