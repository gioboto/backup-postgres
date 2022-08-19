#!/bin/bash
#
#script backupdb.sh
# Version : 2.0
#Para generar respaldos de postgres usando dumpall y guararlos en formato zip con clave
#Autor : Ing. Jorge Navarrete
#mail : jorge_n@web.de
#Fecha : 2019-11-20

#script backupdb.sh
#Para generar respaldos de postgres usando dumpall y guararlos en formato zip con clave

backup_dir='/var/respaldos/respaldos'
cd $backup_dir
#Borro bakcups anteriores
#rm -fr *.gz
timeslot=`date +%H-%M`
timeinfo=`date +%Y-%m-%d`
export PGPASSWORD=Prod-psql-99-PKI
/usr/pgsql-9.3/bin/pg_dumpall | gzip -c > "$backup_dir/all.dbs.out-$timeinfo-$timeslot.gz"
export PGPASSWORD=""
#backups en zip y con clave
/usr/bin/zip -P nidociaHyirv "$backup_dir/all.dbs.out-$timeinfo-$timeslot.gz.zip" "$backup_dir/all.dbs.out-$timeinfo-$timeslot.gz"

