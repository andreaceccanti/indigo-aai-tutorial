#!/bin/bash
set -e

IAM_AUTHZ_CODE_CLIENT_SCOPES=${IAM_AUTHZ_CODE_CLIENT_SCOPES:-"openid profile email offline_access"}

curl -X GET -v -f -L \
  -u ${IAM_AUTHZ_CODE_CLIENT_ID}:${IAM_AUTHZ_CODE_CLIENT_SECRET} \
  -d client_id=${IAM_AUTHZ_CODE_CLIENT_ID} \
  -d redirect_uri=${IAM_AUTHZ_CODE_CLIENT_REDIRECT_URI} \
  -d nonce=1 \
  -d state=1 \
  -d scope="${IAM_AUTHZ_CODE_CLIENT_SCOPES}" \
  -d response_type=code \
  ${IAM_AUTHORIZATION_ENDPOINT} | tee /tmp/authz_code_response 
