#!/bin/sh

set -e

while [ 1 ]; do
  sh -c "/backup.sh $POSTGRES_HOST $POSTGRES_USER $POSTGRES_PASSWORD $POSTGRES_DB /backups"
  sh -c "/delete_old_backup.sh $TOKEEP /backups"
  echo "Waiting $DELAY..."
  sleep $DELAY
done