#!/bin/bash
# This can be run from cron daily with the following entry
# 0 * * * * /path/backup-mongodb.sh
dir="$( dirname ${BASH_SOURCE[0]})/"
env="${dir}.env"
export $(grep -v '^#' $env | xargs)
db="${MONGO_DB:=sji-bdl}"
user="${MONGO_USERNAME:=sji-bdl}"
pass="${MONGO_PASSWORD:=sji-bdl}"
date=`date "+%H"`
long_date=`date "+%Y%m%d%H"`
backup_name="/data/db/${db}.${date}"
local_backup_name="${LOCAL_PATH}/${db}"
/usr/bin/docker exec db sh -c "exec mongodump -d ${db} -u ${user} --password=${pass} --archive" > $local_bakup_name
