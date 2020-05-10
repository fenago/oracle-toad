create or replace type body DummyObj as
   member procedure method1 (x in varchar2)
   is 
   begin 
    null;
  end method1;
  member function  method2 return date is
   begin
   return sysdate;
  end method2;
end;
/
