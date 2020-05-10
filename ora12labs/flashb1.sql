insert into emp
  (select * from emp as  of timestamp
  to_timestamp('13-MAR-81 10:59:56', 'DD-MON-YY HH24:mi:ss')
   minus select * from emp
/
