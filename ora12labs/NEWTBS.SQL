set echo off
set head off
set feed off
set term off
grant unlimited tablespace to scott;

create tablespace new_data
datafile '$HOME/DATA/DISK4/new01.dbf' size 500k reuse 
/

CREATE TABLE scott.new_emp1
(id                         NUMBER(7),
 last_name                  VARCHAR2(25),
 first_name                 VARCHAR2(25),
 userid                     VARCHAR2(8),
 start_date                 DATE,
 comments                   VARCHAR2(255),
 manager_id                 NUMBER(7),
 title                      VARCHAR2(25),
 dept_id                    NUMBER(7),
 salary                     NUMBER(11, 2),
 commission_pct             NUMBER(4, 2))
tablespace new_data
/
insert into scott.new_emp1
select * from scott.emp
/
commit;
alter system switch logfile
/
insert into scott.new_emp1
select * from scott.new_emp1
/
commit;
alter system switch logfile
/
insert into scott.new_emp1
select * from scott.new_emp1
/
commit;
alter system switch logfile
/
spool wksh14.sh

select 'rm -f ' || file_name || chr(10) from dba_data_files
where tablespace_name = 'NEW_DATA'
/
spool off
! sh wksh14.sh
exit;
