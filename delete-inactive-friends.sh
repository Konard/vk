#!/bin/bash

ACCESS_TOKEN=`cat access-token`

curl "https://api.vk.com/method/execute.deleteInactiveFriends?access_token=${ACCESS_TOKEN}&v=5.131&offset=$1"

printf "\n"
