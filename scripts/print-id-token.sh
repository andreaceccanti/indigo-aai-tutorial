#!/bin/bash

jwt $(jq -r .id_token /tmp/response)
