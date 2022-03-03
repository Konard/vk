#!/bin/bash
set -e

i=0
while [ $i -ne 36 ]
do
  ./delete-inactive-friends.sh "$i"
  i=$(($i+1))
 
  read -p "Continue? [y / n] " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then

  # nothing

  else
  
  echo "Inactive friends deletion is stopped."
  exit 0

  fi
done
