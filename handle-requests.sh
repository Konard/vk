#!/bin/bash

./delete-out-friend-request.sh

sleep 1

i=0
while [ $i -ne 2 ]
do
  ./accept-best-suggestion.sh "$i"
  i=$(($i+1))

  sleep 2
done