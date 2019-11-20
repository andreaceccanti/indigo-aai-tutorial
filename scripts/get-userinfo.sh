#!/bin/bash

userinfo=$(curl -s -L -H "Authorization: Bearer ${IAM_ACCESS_TOKEN}" ${IAM_USERINFO_ENDPOINT})

if [[ $? != 0 ]]; then
  echo "Error!"
  echo $userinfo
  exit 1
fi

echo $userinfo | jq .
