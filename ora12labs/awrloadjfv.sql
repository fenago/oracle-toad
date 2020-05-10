

define directory_name = 'DATA_PUMP_DIR'
define file_name      = 'awrdat_1_141'
define schema_name    = 'JFV'

set echo off heading on underline on verify off 
set feedback off linesize 80 termout on;
whenever sqlerror exit;

prompt ~~~~~~~~~~
prompt  AWR LOAD 
prompt ~~~~~~~~~~
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~  This script will load the AWR data from a dump file. ~
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

variable dmpdir  varchar2(30);
variable dmppath varchar2(4000)

declare

  cursor dirpath (dirname varchar2) is
    select directory_path 
      from dba_directories 
      where directory_name = dirname;

begin
  :dmpdir  := '&directory_name';

   /* select the directory path into a variable */
   open dirpath(:dmpdir);

   fetch dirpath into :dmppath;

   if (dirpath%NOTFOUND) then
     RAISE_APPLICATION_ERROR(-20103, 
                             'directory name ''' || :dmpdir || 
                              ''' is invalid', TRUE);
   end if;
   
   close dirpath;
end;
/


variable dmpfile varchar2(30);

begin
  :dmpfile := '&file_name';
end;
/

variable schname varchar2(30);

begin
  :schname := '&schema_name';
end;
/

set termout on;

set serveroutput on;
exec dbms_output.enable(500000);
set termout on;

column loc    format a80 newline;
column locend format a80;

declare
  begpos   NUMBER;
  numchar  NUMBER  := 74;

begin
  dbms_output.put_line('|');
  dbms_output.put_line('| ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  dbms_output.put_line('|  Loading the AWR data from the following  ');
  dbms_output.put_line('|  directory/file:                          ');

  begpos := 1;
  WHILE (begpos <= length(:dmppath)) LOOP
    dbms_output.put_line('|   ' || substr(:dmppath, begpos, numchar));
    begpos := begpos + numchar;
  END LOOP;

  dbms_output.put_line('|   ' || :dmpfile || '.dmp');
  dbms_output.put_line('| ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  dbms_output.put_line('|');
  dbms_output.put_line('|  *** AWR Load Started ...');
  dbms_output.put_line('|');
  dbms_output.put_line('|  This operation will take a few moments. The ');
  dbms_output.put_line('|  progress of the AWR load operation can be ');
  dbms_output.put_line('|  monitored in the following directory/file: ');

  begpos := 1;
  WHILE (begpos <= length(:dmppath)) LOOP
    dbms_output.put_line('|   ' || substr(:dmppath, begpos, numchar));
    begpos := begpos + numchar;
  END LOOP;

  dbms_output.put_line('|   ' || :dmpfile || '.log');
  dbms_output.put_line('|');
end;
/

whenever sqlerror continue;
set heading off;
set linesize 110 pagesize 50000;
set echo off;
set feedback off;
set termout off;
set serveroutput off;

begin
  /* call PL/SQL routine to extract the data */
  dbms_swrf_internal.awr_load(schname => :schname,
                              dmpfile  => :dmpfile,
                              dmpdir   => :dmpdir);
end;
/

undefine directory_name
undefine file_name
undefine schema_name
set termout on;
set serveroutput on;
