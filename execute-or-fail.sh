#!/bin/bash
# set -e

TOKEN_EXPIRED_ERROR_MESSAGE="User authorization failed: access_token has expired."
QUERY_RESULT=$(curl -s "$1")

ERROR_MESSAGE=$(echo "$QUERY_RESULT" | jq .error.error_msg | tr -d '"')

echo "$QUERY_RESULT" | jq

if [ "$ERROR_MESSAGE" = "$TOKEN_EXPIRED_ERROR_MESSAGE" ]; then
  # echo "$ERROR_MESSAGE"
  # exit 1

  # Get new access token
  EMAIL=`cat email`
  PASS=`cat pass`
  cat vk_auth_token.side | jq '.tests[0].commands[2].value="'"$EMAIL"'" | .tests[0].commands[4].value="'"$PASS"'"' > vk_auth_token.temp
  selenium-side-runner vk_auth_token.temp | grep -o "https.*" | sed -r "s|.*access_token=([0-9a-f]+).*|\1|" > access-token
  rm vk_auth_token.temp
  echo "Token is updated"
fi;