#!/bin/bash

ACCESS_TOKEN=`cat access-token`

./handle-requests.sh

while :
do
  echo "deleteFirstDeactivatedFriend:"

  curl -s "https://api.vk.com/method/execute.deleteFirstDeactivatedFriend?access_token=${ACCESS_TOKEN}&v=5.131" | jq

  echo

  sleep 600

  echo "acceptAllFriendRequests:"

  curl -s "https://api.vk.com/method/execute.acceptAllFriendRequests?access_token=${ACCESS_TOKEN}&v=5.131" | jq

  echo

  sleep 600
done
