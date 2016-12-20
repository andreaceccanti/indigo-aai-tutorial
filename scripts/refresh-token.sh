#!/bin/bash
set -ex
curl -s -L \
  --user ${IAM_CLIENT_ID}:${IAM_CLIENT_SECRET} \
  -d grant_type=refresh_token \
  -d refresh_token=${REFRESH_TOKEN} \
  ${IAM_TOKEN_ENDPOINT} 
