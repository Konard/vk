#!/bin/bash
set -e

ACCESS_TOKEN=`cat access-token`

./execute-or-fail.sh "https://api.vk.com/method/execute.deleteFirstDeactivatedFriend?access_token=${ACCESS_TOKEN}&v=5.131"

echo