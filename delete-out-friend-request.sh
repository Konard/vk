#!/bin/bash

ACCESS_TOKEN=`cat access-token`

TOKEN_EXPIRED_ERROR_MESSAGE="User authorization failed: access_token has expired."
QUERY_RESULT=$(curl -s "https://api.vk.com/method/execute.deleteOutFriendRequests?access_token=${ACCESS_TOKEN}&v=5.131")

ERROR_MESSAGE=$(echo "$QUERY_RESULT" | jq .error.error_msg | tr -d '"')

if [ "$ERROR_MESSAGE" = "$TOKEN_EXPIRED_ERROR_MESSAGE" ]; then
  echo "$ERROR_MESSAGE"
  exit 1
fi;

echo "$QUERY_RESULT" | jq
