var g_salary number
BEGIN
SELECT (SALARY + NVL(COMM,0)) + nvl(comm,0) * .05 
INTO :g_salary
FROM STAFF WHERE ID = &emp_id;
END;
/
print g_salary