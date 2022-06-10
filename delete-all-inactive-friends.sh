#!/bin/bash
set -e

i="$1"
while [ $i -ne 433 ]
do
  ./delete-inactive-friends.sh "$i"
  
  echo "$i step is complete."
  echo
  
  i=$(($i+1))

  sleep 1
done
