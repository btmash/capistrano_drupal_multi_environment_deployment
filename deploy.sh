#!/bin/bash -x
#source ~/.bash_profile

HOST=$1
CAPISTRANO_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/integration"

if [[ -z $HOST ]]
then
  echo "Missing args! Exiting"
  exit 1
fi

cd $CAPISTRANO_DIRECTORY; cap $HOST deploy

