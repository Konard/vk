#!/bin/bash
set -e

./handle-requests.sh

while :
do
  ./delete-first-deactivated-friend.sh

  sleep 600

  ./accept-all-friend-requests-once.sh

  sleep 600
done
