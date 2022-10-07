#!/bin/bash
set -eu

echo "whoami  : `whoami`"
echo "date    : `date`"
#echo "PROFILE : ${PROFILE}"
echo "CRONTAB_FILE_PATH : ${CRONTAB_FILE_PATH}"

crontab ${CRONTAB_FILE_PATH}
crontab -l

cron -f -l 2
