#!/bin/bash -x
source ~/.bash_profile

HOST=$1

if [[ -z $HOST ]]
then
  echo "Missing args! Exiting"
  exit 1
fi

cd ~/scripts/integration; cap $HOST deploy:rollback

