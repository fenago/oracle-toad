set echo on

drop tablespace tbsspc 
including contents and datafiles;

CREATE SMALLFILE TABLESPACE "TBSSPC"
DATAFILE 'tbsspc1.dbf' SIZE 50M
AUTOEXTEND ON NEXT 10M MAXSIZE 200M
LOGGING
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT AUTO;

connect spc/spc

drop table spct purge;
create table spct(id number, name varchar2(2000))
tablespace tbsspc;

exec DBMS_STATS.GATHER_TABLE_STATS(-
ownname=>'SPC', tabname=>'SPCT',-
estimate_percent=>DBMS_STATS.AUTO_SAMPLE_SIZE);

exit;
