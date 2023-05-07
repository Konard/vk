#!/bin/bash
set -e

./delete-out-friend-request.sh

sleep 16

./delete-first-deactivated-friend.sh

sleep 16

./accept-all-friend-requests-once.sh

while :
do
  sleep 600

  ./delete-out-friend-request.sh

  sleep 600

  ./delete-first-deactivated-friend.sh

  sleep 600

  ./accept-all-friend-requests-once.sh
done
