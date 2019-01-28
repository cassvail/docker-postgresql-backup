#!/bin/sh

set -e

HOST=$1
USERNAME=$2
PASSWORD=$3
DATABASE=$4
DIR=$5

BAKNAME="$(date +%Y%m%d%H%M)_$DATABASE"

mkdir -p $DIR/

echo "$BAKNAME Started"
echo "Backing up $DATABASE"
export PGPASSWORD=$PASSWORD
pg_dump -Fp -h "$HOST" -U "$USERNAME" "$DATABASE" -f /$BAKNAME.in_progress.sql
mv /$BAKNAME.in_progress.sql /$BAKNAME.sql
zip /$BAKNAME.sql.zip /$BAKNAME.sql
rm /$BAKNAME.sql
mv /$BAKNAME.sql.zip /$DIR/$BAKNAME.sql.zip
echo "$BAKNAME Done"
