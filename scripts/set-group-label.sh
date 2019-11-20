#!/bin/bash
set -ex

IAM_ACCESS_TOKEN=$(cat .access_token)

curl -s -L -H "Content-type: application/json"  -H "Authorization: Bearer ${IAM_ACCESS_TOKEN}" \
	-X POST \
	--data '{"name":"'$2'"}' \
	${IAM_GROUP_ENDPOINT}/$1/labels | jq .
