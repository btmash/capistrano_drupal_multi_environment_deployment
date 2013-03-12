#!/bin/bash -x
#source ~/.bash_profile

ENVIRONMENT=$1
CAPISTRANO_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/integration"

if [[ -z $ENVIRONMENT ]]
then
  echo "Missing args! Exiting"
  exit 1
fi

cd $CAPISTRANO_DIRECTORY; cap $ENVIRONMENT drupal:run_cron

