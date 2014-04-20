#!/bin/sh

ALIAS=$1
DEST_DIR=$2

if [ -z "$2" ]; then
  DEST_DIR=`pwd`
fi
SITES=`drush sa $ALIAS --fields=#name --format=list`
for site in $SITES
do
  drush @$site sql-dump > $DEST_DIR/$site.sql
  echo $site_name
done

