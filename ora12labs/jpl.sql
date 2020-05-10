declare
   m_selection jpl_sel_tab;
begin
   select jpl_sel_row(n1, n2)
    BULK COLLECT into m_selection
    from child
    where n2 in (1,2,3);
for I in 1..m_selection.count loop
      dbms_output.put_line(m_selection(i).n1 || ' ' || m_selection(i).n2 );
end loop;
end;
/
