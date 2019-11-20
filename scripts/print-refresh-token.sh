#!/bin/bash

jwt $(jq -r .refresh_token /tmp/response)
