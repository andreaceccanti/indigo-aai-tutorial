#!/bin/bash
set -e

if [[ -n "${VERBOSE}" ]]; then
  set -x
fi

IAM_CLIENT_ID=${IAM_CLIENT_ID:-iam-client}
IAM_CLIENT_SECRET=${IAM_CLIENT_SECRET} 

IAM_TOKEN_ENDPOINT=${IAM_TOKEN_ENDPOINT:-https://iam.local.io/token}

IAM_CLIENT_SCOPES=${IAM_CLIENT_SCOPES:-"openid profile email offline_access"}

IAM_CLIENT_AUDIENCE=${IAM_CLIENT_AUDIENCE:-""}

if [[ -z "${IAM_CLIENT_SECRET}" ]]; then
  echo "Please provide a client secret setting the IAM_CLIENT_SECRET env variable."
  exit 1;
fi

if [[ -z ${IAM_USER} ]]; then
  read -p "Username: " IAM_USER
fi

if [[ -z ${IAM_PASSWORD} ]]; then
  echo -ne "Password:"
  read -s IAM_PASSWORD
echo
fi

if [ -z "${IAM_CLIENT_AUDIENCE}" ]; then

  curl -s -L \
    -d client_id=${IAM_CLIENT_ID} \
    -d client_secret=${IAM_CLIENT_SECRET} \
    -d grant_type=password \
    -d username=${IAM_USER} \
    -d password=${IAM_PASSWORD} \
    -d scope="${IAM_CLIENT_SCOPES}" \
    ${IAM_TOKEN_ENDPOINT} | tee /tmp/response | jq .
else
  curl -s -L \
    -d client_id=${IAM_CLIENT_ID} \
    -d client_secret=${IAM_CLIENT_SECRET} \
    -d grant_type=password \
    -d username=${IAM_USER} \
    -d password=${IAM_PASSWORD} \
    -d scope="${IAM_CLIENT_SCOPES}" \
    -d audience="${IAM_CLIENT_AUDIENCE}" \
    ${IAM_TOKEN_ENDPOINT} | tee /tmp/response | jq .
fi
