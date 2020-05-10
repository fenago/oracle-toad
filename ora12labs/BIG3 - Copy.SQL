spool big3.lis
set timing on
drop table big2;
drop public synonym big2;
drop synonym big2;
create table big2 (bigno  number(6), bname varchar2(20))
       pctfree 80
       pctused 15
       storage(initial    8K
               next       8K
               minextents 20
               maxextents 121
               pctincrease 0)
       tablespace jerrY;
BEGIN
    FOR i IN 1..5000 Loop
        If i < 1001 then
           insert into big2 values(i,'ONE THOUSAND');
        Elsif i between 2000 and 5000 then
           insert into big2 values(i,'BET 2K AND 5K');
        Else
           insert into big2 values(i, null);
        End If;
        If mod(i,500) = 0 then commit;
End If;
    End Loop;
End;
/
Create index big2_bigno       on  big2(bigno) tablespace jerindx;
Create index big2_bname       on  big2(bname) tablespace jerindx;
Create index big2_bname_bigno on big2(bname,bigno) tablespace jerindx;
Create public synonym big2 for big2;
Analyze table big2 compute statistics;
set timing off
spool off
/
