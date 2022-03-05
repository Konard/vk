#!/bin/bash
set -e

i="$1"
while [ $i -ne 433 ]
do
  ./delete-inactive-friends.sh "$i"
  
  echo "$i step is complete."
  echo
  
  i=$(($i+1))
 
  read -p "Continue? [y / n] " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
  
  echo ""
  echo "Inactive friends deletion is stopped."
  exit 0
  
  else
  
  echo ""

  fi
done
