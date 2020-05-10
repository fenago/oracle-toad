COL emp_name            FORMAT A24          HEADING 'Employee Name'
COL top_node_name       FORMAT A12          HEADING 'Top Of Node'
COL lvl_ind             FORMAT 999          HEADING 'Lvl'
COL node_path           FORMAT A24          HEADING 'Node Path'

-- Show all employees starting at the top of the hierarchy 
SELECT 
     (last_name || ', ' || first_name) emp_name
    ,CONNECT_BY_ROOT last_name top_node_name
    ,LEVEL lvl_ind
    ,SYS_CONNECT_BY_PATH (last_name, '->') node_path
  FROM 
     hr.employees
 START WITH employee_id = 100
 CONNECT BY PRIOR employee_id = manager_id
 ORDER SIBLINGS BY employee_id;

/
