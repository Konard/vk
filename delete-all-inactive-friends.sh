#!/bin/bash
set -e

i=0
while [ $i -ne 36 ]
do
  ./delete-inactive-friends.sh "$i"
  i=$(($i+1))

  sleep 1
done