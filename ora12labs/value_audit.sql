CREATE OR REPLACE TRIGGER system.hrsalary_audit
   AFTER UPDATE OF salary ON hr.employees 
    REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW  
BEGIN
   IF :old.salary != :new.salary THEN
     INSERT INTO system.audit_employees  
     VALUES (sys_context('userenv','os_user'), 
     sysdate, sys_context('userenv','ip_address'),     :new.employee_id ||
     ' salary changed from '||:old.salary|| 
     ' to '||:new.salary);
  END IF;
END;
/
