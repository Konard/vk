#!/bin/bash

ACCESS_TOKEN=`cat access-token`

while :
do
  curl "https://api.vk.com/method/execute.acceptAllFriendRequests?access_token=${ACCESS_TOKEN}&v=5.131"

  printf "\n"

  sleep 2400
done
