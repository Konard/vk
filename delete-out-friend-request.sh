#!/bin/bash
set -e

ACCESS_TOKEN=`cat access-token`

./execute.sh "https://api.vk.com/method/execute.deleteOutFriendRequests?access_token=${ACCESS_TOKEN}&v=5.131"

echo