REM #############################
REM  File 	: credb
REM  Purpose	: Uniform database environment in Class rooms
REM  Created     : 19th April 1999
REM 
REM  Following values may need to be updated appropriately.
REM  $DB_NAME	Example db01
REM 		The database name - to be same for instance and service names.
REM  $ORADATA  	$HOME/DATA unix in classes
REM 		Data directory containing datafile, control file and log files
REM 		In class rooms you may use DISK1, 2, 3 etc., to
REM 		simulate multiple disks.
REM  $ORABASE 	Example : D:\ORACLE\ADMIN\LAP8i
REM  		Directory where the administrative sudirectories exist
REM  		The admin. sudirectories are BDUMP, CDUMP, UDUMP, PFILE
REM 		Create the subdirectories if they are not already created.
REM 
REM #############################

spool $HOME/LABS/createdb.log
set echo on
connect INTERNAL/oracle as sysdba
startup nomount pfile=$HOME/LABS/initdb01.ora
CREATE DATABASE db01
LOGFILE 
    GROUP 1 ('$HOME/DATA/DISK3/redo0101.log',
             '$HOME/DATA/DISK4/redo0102.log') size 2M,
    GROUP 2 ('$HOME/DATA/DISK4/redo0201.log',
             '$HOME/DATA/DISK3/redo0202.log') size 2M
MAXLOGFILES 32
MAXLOGMEMBERS 3
MAXLOGHISTORY 1
DATAFILE '$HOME/DATA/DISK1/system01.dbf' SIZE 100M REUSE AUTOEXTEND ON
MAXDATAFILES 254
MAXINSTANCES 1
CHARACTER SET WE8ISO8859P1
NATIONAL CHARACTER SET WE8ISO8859P1;
spool off

REM : run credb1.sql to create other tablespaces and users
@credb1.sql
