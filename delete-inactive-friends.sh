#!/bin/bash
set -e

ACCESS_TOKEN=`cat access-token`

./execute-or-fail.sh "https://api.vk.com/method/execute.deleteInactiveFriends?access_token=${ACCESS_TOKEN}&v=5.131&offset=$1"

echo
