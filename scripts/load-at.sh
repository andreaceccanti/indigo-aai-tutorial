#!/bin/bash
set -e
at=$(jq -r .access_token /tmp/response)

export IAM_ACCESS_TOKEN="${at}"
