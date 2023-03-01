#!/bin/bash
# This can be run from cron daily with the following entry
# 0 * * * * /path/backup-mongodb.sh
dir="$( dirname ${BASH_SOURCE[0]})/"
env="${dir}/.env"
export $(grep -v '^#' $env | xargs)
db="${MONGO_DB:=sji-bdl}"
user="${MONGO_USERNAME:=sji-bdl}"
pass="${MONGO_PASSWORD:=sji-bdl}"
date=`date "+%H"`
long_date=`date "+%Y%m%d%H"`
backup_name="/data/db/${db}.${date}"
temp_local_backup_name="${dir}${db}.${date}"
docker exec -it db mongodump --host=localhost --port=27017 --db=$db --username=$user --password=$pass -o $backup_name
docker cp db:${backup_name} $temp_local_backup_name
docker exec -it db rm -rf $backup_name
tar -zcf ${temp_local_backup_name}.${long_date}.tgz $temp_local_backup_name
rm -rf $temp_local_backup_name
