#!/bin/sh

set -e

TOKEEP=$1
DIR=$2
NOW=$(date +%Y%m%d%H%M)

echo "Cleaning old backups $NOW exept last $TOKEEP"

# http://stackoverflow.com/questions/2960022/shell-script-to-count-files-then-remove-oldest-files#2961817
SEDCMD="1,$(echo $TOKEEP)d"
TODELETE=$(ls -t -1 $DIR | sed -e $SEDCMD)

if [ -z $TODELETE ]; then
  echo "No backups to delete."
else
  for FILE in $TODELETE;
    do
      rm $DIR/$FILE
      echo "Deleting $FILE"
    done
fi

echo "Cleaning ended $NOW"