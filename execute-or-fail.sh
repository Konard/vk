#!/bin/bash
set -e

TOKEN_EXPIRED_ERROR_MESSAGE="User authorization failed: access_token has expired."
QUERY_RESULT=$(curl -s "$1")

ERROR_MESSAGE=$(echo "$QUERY_RESULT" | jq .error.error_msg | tr -d '"')

if [ "$ERROR_MESSAGE" = "$TOKEN_EXPIRED_ERROR_MESSAGE" ]; then
  echo "$ERROR_MESSAGE"
  exit 1
fi;

echo "$QUERY_RESULT" | jq