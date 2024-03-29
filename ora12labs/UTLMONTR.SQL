rem 
rem $Header: utlmontr.sql 7010300.2 94/04/04 02:35:34 snataraj Generic<base> $ monitor.sql 
rem 
Rem Copyright (c) 1988 by Oracle Corporation
Rem NAME
REM    UTLMONTR.SQL
Rem FUNCTION
Rem   Grant public access to all views used by the char-mode SQLDBA.
Rem NOTES
Rem   This file must be run while logged-in as SYS.
Rem   Catalog.sql must have been run before this file is run.
Rem
Rem   By default, only users with dba privilege may access some
Rem   SQLDBA screens.  The execution of this file grants read access
Rem   on all views used by the char-mode SQL*DBA to the MONITORER role
Rem   and then grants that role to public.  This file may be edited to
Rem   provide access to a subset of your users to a subset of the 
Rem   screens.  See the DBA guide for more information.
Rem
Rem MODIFIED
Rem     wmaimone   02/23/94 -  grant v$sess_io to monitorer
Rem     wmaimone   02/14/94 -  grant monitorer to public, matching doc
Rem     rnakhwa    04/19/93 -  Bugs # 145783 and # 145557
Rem     glumpkin   10/20/92 -  Renamed from MONITOR.SQL 
Rem     cozbutun   06/29/92 -  make use of roles and remove unnecessary grants
Rem     rnakhwa    03/10/92 -  More views added---v$thread, v$log & v$datafile 
Rem   Bulchan    10/21/88 - Add views for mon file and mon rollback
Rem   Bulchan    10/03/88 - Add v$parameter
Rem   Bulchan      07/22/88 - Add v_$sga 
Rem   Mendelsohn   07/16/88 - Creation
Rem

set echo on;
drop role monitorer;
create role monitorer;

grant select on v_$datafile to monitorer;
grant select on v_$log to monitorer;
grant select on v_$thread to monitorer;

grant select on v_$process to monitorer;
grant select on v_$bgprocess to monitorer;
grant select on v_$session to monitorer;
grant select on v_$transaction to monitorer;
grant select on v_$latch to monitorer;
grant select on v_$latchname to monitorer;
grant select on v_$latchholder to monitorer;
grant select on v_$lock to monitorer;
grant select on v_$sesstat to monitorer;
grant select on v_$sysstat to monitorer;
grant select on v_$access to monitorer;
grant select on v_$dbfile to monitorer;
grant select on v_$filestat to monitorer;
grant select on v_$logfile  to monitorer;
grant select on v_$rollname to monitorer;
grant select on v_$rollstat to monitorer;
grant select on v_$sess_io to monitorer;

Rem  v_$sga here for want of a better place. Enables 'SHOW SGA' command
grant select on v_$sga to monitorer;

Rem   v$_parameter here too for want of a better place.  Enables 'SHOW
Rem   PARAMETER'
grant select on v_$parameter to monitorer;

Rem
Rem  Grant to public without admin option
grant monitorer to public;

Rem  let's also grant this role to dba with admin option, for admin purposes
grant monitorer to dba with admin option;

set echo off;

