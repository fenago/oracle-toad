COL mgr_id              FORMAT 99999        HEADING 'MgrID'
COL mgr_name            FORMAT A24          HEADING 'Manager Name'
COL level               FORMAT 999          HEADING 'Lvl'
COL emp_id              FORMAT 99999        HEADING 'EmpID'
COL emp_name            FORMAT A24          HEADING 'Employee Name'
SELECT E.manager_id mgr_id ,(M.last_name || ', ' || M.first_name) mgr_name
     ,LEVEL,E.employee_id emp_id,E.last_name||','||E.first_name emp_name
  FROM   hr.employees E,hr.employees M
 WHERE E.manager_id = M.employee_id
 START WITH E.manager_id = 101
CONNECT BY PRIOR E.employee_id = E.manager_id
 ORDER BY SIBLINGS e.manager_id, e.employee_id;

/
