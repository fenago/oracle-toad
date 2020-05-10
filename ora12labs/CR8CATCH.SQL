CREATE PROCEDURE catch_alerts (max_loop NUMBER) IS
    wait_status	INTEGER := 0;
    alert_msg	VARCHAR2(1800);
    tot_salary	NUMBER(9,2);
    loop_cnt		NUMBER := 0;
  BEGIN
   DBMS_ALERT.REGISTER('upd_alert');
    WHILE wait_status = 0 AND 
            loop_cnt < max_loop LOOP
  -- loop until we TIMEOUT or hit MAX_LOOP…
     loop_cnt := loop_cnt + 1;
     DBMS_ALERT.WAITONE('upd_alert', alert_msg,
                            wait_status);
     SELECT SUM(salary) INTO tot_salary
		FROM employee;
     DBMS_OUTPUT.PUT_LINE(alert_msg);
     DBMS_OUTPUT.PUT_LINE('Total Payroll Cost: '
        || tot_salary);
    END LOOP;
   DBMS_ALERT.REMOVE('upd_alert'); --take us off list
  END catch_alerts;   
