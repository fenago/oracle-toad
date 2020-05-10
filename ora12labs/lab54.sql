Begin
  For I in 1..60 loop
       For j in 1..6 loop
         Update t set c=2;
         Commit;
       End loop;
     Dbms_lock.sleep(1);
  End loop;
End;
/
