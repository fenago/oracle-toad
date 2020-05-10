var grand_total number
exec :grand_total := 0;
declare
    w_dept_id staff.dept%TYPE := &deptid;
    Grand_Total number(8);
    cursor staff_cursor is
        select salary + NVL(comm,0) Total_Comp
        from staff
        where dept = w_dept_id;
begin
    for staff_rec in staff_cursor LOOP
        if staff_rec.Total_Comp >= 0.00 and staff_rec.Total_Comp <= 10000.00
        then
            Grand_Total := staff_rec.Total_Comp;
        elsif staff_rec.Total_Comp >= 10000.01 and staff_rec.Total_Comp <= 20000.00
            then
            Grand_Total := staff_rec.Total_Comp * 1.02;
        elsif staff_rec.Total_Comp >= 10000.01 and staff_rec.Total_Comp <= 20000.00
        then
            Grand_Total := staff_rec.Total_Comp * 1.04;
        end if;
:grand_total := :grand_total + grand_total;
    end loop;
EXCEPTION
   when NO_DATA_FOUND then
     insert into exception_table(message)
     values ('INCORRECT department NUMBER ' || to_char(w_dept_id));
     Commit work;
   when OTHERS then
     insert into exception_table(message)
     values ('Other Exception');
     Commit work;
end;
/
PRINT GRAND_TOTAL