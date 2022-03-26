#!/bin/bash
set -e

./delete-first-deactivated-friend.sh

sleep 8

./handle-requests.sh

sleep 16

./accept-all-friend-requests-once.sh

while :
do
  sleep 600

  ./delete-first-deactivated-friend.sh

  sleep 600

  ./accept-all-friend-requests-once.sh
done
