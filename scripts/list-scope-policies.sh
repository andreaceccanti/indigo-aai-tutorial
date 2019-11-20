#!/bin/bash

curl -s -L -H "Authorization: Bearer ${IAM_ACCESS_TOKEN}" ${IAM_SCOPE_POLICIES_ENDPOINT} | jq .
