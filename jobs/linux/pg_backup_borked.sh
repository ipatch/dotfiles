#!/bin/bash
# CREDIT: https://stackoverflow.com/a/958213/708807
logfile="$HOME/logs/pg_backup.log"
backup_dir="$HOME/backup/pg/"
touch $logfile
databases=`psql -h localhost -U postgres -q -c "\l" | sed -n 4,/\eof/p | grep -v rows\) | grep -v template0 | grep -v template1 | awk {'print $1'}`

echo "Starting backup of pg databases " >> $logfile

for i in $databases; do
  dateinfo=`date '+%Y-%m-%d %H:%M:%S'`
  timeslot=`date '+%Y%m%d%H%M'`
  /usr/bin/vacuumdb -z -h localhost -U postgres $i >/dev/null 2>&1
  /usr/bin/pg_dump -U postgres -F c -b $i -h localhost -f $backup_dir/$i-database-$timeslot.backup
  echo "Backup and Vacuum complete on $dateinfo for database: $i " >> $logfile
done
echo "Done backing up of pg databases " >> $logfile

tail -15 $HOME/logs/pg_backup.log | mailx me@chrisrjones.com
