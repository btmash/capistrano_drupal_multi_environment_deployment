#!/bin/bash -x
#source ~/.bash_profile

# Synchronize the environments from HOST1 over to HOST2
CAP_HOST1=$1
CAP_HOST2=$2
CAP_ENVIRONMENT=$3
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

if [[ -z $CAP_ENVIRONMENT ]]
then
	echo "Missing CAPISTRANO Host Environment (Optional) - Setting to CAPISTRANO Deployment Environment 1"
	CAP_ENVIRONMENT=$CAP_HOST1
fi

cd $CAPISTRANO_DIRECTORY; cap $CAP_ENVIRONMENT drupal:file_sync -s source_environment=$CAP_HOST1 -s destination_environment=$CAP_HOST2
