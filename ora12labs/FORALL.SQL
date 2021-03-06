declare
  type num_type is table of number index by binary_integer;
  type vc_type is table of varchar2(32) index by binary_integer;
  num_tab  num_type;
  vc_tab     vc_type;
 begin
  num_tab(1) := 2;
  vc_tab(1) := 'asdf';
  num_tab(2)  := 3;
    vc_tab(2)  := 'wret';
  forall j in 1..num_tab.count
  insert into test_table values (num_tab(j), vc_tab(j));
end;
/
