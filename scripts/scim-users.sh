#!/bin/bash

curl -s -L -H "Authorization: Bearer ${IAM_ACCESS_TOKEN}" ${IAM_SCIM_USERS_ENDPOINT} | jq .
