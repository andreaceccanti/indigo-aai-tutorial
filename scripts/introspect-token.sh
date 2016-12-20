#!/bin/bash

IAM_CLIENT_ID=${IAM_CLIENT_ID}
IAM_CLIENT_SECRET=${IAM_CLIENT_SECRET} 

if [[ -z "${IAM_CLIENT_SECRET}" ]]; then
  echo "Please provide a client secret setting the IAM_CLIENT_SECRET env variable."
  exit 1;
fi

result=$(curl -s -L \
  -u ${IAM_CLIENT_ID}:${IAM_CLIENT_SECRET} \
  -d token=${IAM_ACCESS_TOKEN} \
  ${IAM_INTROSPECTION_ENDPOINT})

if [[ $? != 0 ]]; then
  echo "Error!"
  echo $result
  exit 1
fi

echo $result | jq .
