create package emp_actions as
    TYPE EmpRec_Type is RECORD(emp_id INTEGER,salary REAL);
    CUROSR desc_salary(emp_id NUMBER) RETURN EmpRecTYPe;

    PROCEDURE hire_employee
        (ename    char(9),
         mgr      number(4),
         salary   number(7,2),
         comm     number(7,2),
         dept     number(4));

    PROCEDURE fire_employee(emp_id  NUMBER);
END EMP_ACTIONS:
BEGIN
 LOOP
         Select max(po) + 1 into new_po  from puorder;
         INSERT INTO puorder (PO,PO_DATE) VALUES(new_po,sysdate);
         countr := countr + 1;
         exit when countr = 10;
 END LOOP;
COMMIT;
END;
/
