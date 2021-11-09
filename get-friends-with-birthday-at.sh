#!/bin/bash
set -e

ACCESS_TOKEN=`cat access-token`

./execute.sh "https://api.vk.com/method/execute.getFriendsWithBirthdayAt?access_token=${ACCESS_TOKEN}&v=5.131&date=$1&offset=$2"

echo