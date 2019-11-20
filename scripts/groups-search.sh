#!/bin/bash

curl -s -L -H "Authorization: Bearer ${IAM_ACCESS_TOKEN}" ${IAM_HOSTNAME}/iam/groups/search | jq .
