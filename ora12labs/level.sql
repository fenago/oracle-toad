column org_chart format a15
select lpad(last_name, LENGTH(last_name)+(LEVEL*2)-2,'_')
          as org_chart
          FROM employees
          START WITH last_name='King'
          CONNECT BY PRIOR employee_id=manager_id
/
