--lab_c_01_07.sql
set echo on
connect jfv/jfv
DECLARE
t number;
BEGIN
for i in 1..2000 loop
select count(*) into t from dba_objects;
end loop;
END;
/
exit;
