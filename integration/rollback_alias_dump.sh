#!/bin/sh

ALIAS=$1
DEST_DIR=$2

if [ -z "$2" ]; then
  DEST_DIR=`pwd`
fi

SITES=`drush sa $ALIAS --fields=#name --format=list`

for site in $SITES
do
  if [ -f $DEST_DIR/$site.sql ]; then
    echo "Rolling back $site_name database."
    drush @$site --yes sql-drop
    drush @$site sqlc < $DEST_DIR/$site_name.sql
  fi
done

