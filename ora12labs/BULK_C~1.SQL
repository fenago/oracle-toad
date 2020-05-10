declare
  type num_tab_type is table of number index by binary_integer;
  m_num_list   num_tab_type;
  m_deleted        jpl_sel_tab;
  m_n1   num_tab_type;
  m_n2   num_tab_type;
begin
  m_num_list(1)  := 3;
  m_num_list(2)  := 5;
  m_num_list(3)  := 11;
forall  I in 1..m_num_list.count
delete from child
where n2 = m_num_list(i)
returning n1, n2 BULK COLLECT into m_n1, m_n2;
dbms_output.put_line('The first values in n1 and n2 are: '||m_n1(1)||' '||m_n2(1));
end;
/
