#!/bin/sh
 
# Be sure environment variable are set. If not, then it might fail!
# These environment variables are those for the Manual Physical Standby host
export ORACLE_HOME=/logical/oracle/Ora9i
export ORACLE_BASE=/logical/oracle
export ORACLE_STANDBY=tns_alias
export ORACLE_STANDBY_SYSDBA_PASS=change_on_install
export PATH=$ORACLE_HOME/bin:$PATH
export SOURCE_HOST=primary_host
export SOURCE_DRIVE=/primary/absolute/path/to/archived/redo/logs
export LOCAL_ARC_PARTH=/path/to/logical/archive/dest
 
# Check the date command usage depending on the platform
dateexec=`date "+%Y-%m-%d-%H-%M"`
 
# copy archived redo logs from main database
archivemove.sh > $dateexec.generic.log
 
# recover/sync the Manual Standby Database
recover.sh >> $dateexec.generic.log


