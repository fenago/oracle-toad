declare
  type emp_tab_type is table of number(6) index by binary_integer;
  type name_tab_type is table of varchar2(30) index by binary_integer;
  type year_tab_type is table of number(6) index by binary_integer;
/* create pl/sql tables */
  emp_list   emp_tab_type;
  name_list  name_tab_type;
  year_list  year_tab_type;
  max_rows   number(6) := 1000;
  new_empid  number(6);
/*  declare cursors */
cursor table_load is
select table_name from all_tables;

cursor bigno_load is
select bigno from big;
/* DECLARE COUNTER
countr  binary_integer := 1;  

begin
/*  load the name_list pl/sql table */
for t1 in table_load loop
     name_list(countr) := t1.table_name;
/* GET THE SEQUENCE NUMBER FOR EMP_ID */
select employee_seq.currval into emp_list(countr) from dual;
select employee_seq.nextval into new_empid from dual;
countr := countr + 1;
exit when countr > 1000;
end loop;
/*  load the year_list pl/sql table */
countr := 1;
for b1 in bigno_load loop
     year_list(countr) := b1.bigno;
countr := countr + 1;
exit when countr > 1000;
end loop;
/* use the FORALL to load the emp_info table */
 forall i in 1..YEAR_LIST.count
insert into emp_info values (emp_list(i),NAME_LIST(I),YEAR_LIST(I));
dbms_output.put_line('The first values in TABLE_NAME and BIGNO are: '||name_list(1)||' '||year_list(1));
end;
/
