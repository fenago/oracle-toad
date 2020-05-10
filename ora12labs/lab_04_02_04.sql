-- lab_04_02_04.sql 
-- (Parameter &1) is number of tx per second

set echo off
set feedback off
set verify off

-- Run it after baseline created
-- Whatever the time it should show deviations from the norm
Declare
tps 	number := &1;
begin

tps := tps/2;
-- Rate of 40 (20*2) Tx per sec
for i in 1..tps loop
insert into work values(1);
commit;
delete work where rownum<2;
commit;
end loop;
end;
/

exit;
