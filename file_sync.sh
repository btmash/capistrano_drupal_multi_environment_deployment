#!/bin/bash -x
#source ~/.bash_profile

# Synchronize the environments from HOST1 over to HOST2
CAP_HOST1=$1
CAP_HOST2=$2
CAPISTRANO_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/integration"

if [[ -z $CAP_HOST1 ]]
then
	echo "Missing CAPISTRANO Deployment Environment 1"
	exit 1
fi

if [[ -z $CAP_HOST2 ]]
then
	echo "Missing CAPISTRANO Deployment Environment 2"
	exit 1
fi

cd $CAPISTRANO_DIRECTORY; cap $CAP_HOST1 drupal:file_sync -s destination_environment=$CAP_HOST2
