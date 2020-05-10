DECLARE
bonus number(7,2) := 0;
sal number(7,2);
BEGIN
select comm,salary  into bonus,sal from staff
where  id = 50;
IF sal > 20000.00 then
UPDATE staff 
set comm = (sal + bonus * .05)
where  id = 50;
ELSE
INSERT INTO STAFF VALUES(600,'RICHARD,10,'MGR',11,30000,0);
END IF;
COMMIT;
END;
/
