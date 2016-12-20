#!/bin/bash

IAM_CLIENT_ID=${IAM_CLIENT_ID}
IAM_CLIENT_SECRET=${IAM_CLIENT_SECRET} 

if [[ -z "${IAM_CLIENT_SECRET}" ]]; then
  echo "Please provide a client secret setting the IAM_CLIENT_SECRET env variable."
  exit 1;
fi

userinfo=$(curl -s -L -H "Authorization: Bearer ${IAM_ACCESS_TOKEN}" ${IAM_USERINFO_ENDPOINT})

if [[ $? != 0 ]]; then
  echo "Error!"
  echo $userinfo
  exit 1
fi

echo $userinfo | jq .
