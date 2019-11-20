#!/bin/bash

jwt $(jq -r .access_token /tmp/response)
