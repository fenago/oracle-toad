CREATE OR REPLACE TRIGGER OLD_NEW_TRIG
BEFORE
UPDATE ON ORG
FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('OLD DEPTNUMB: '||TO_CHAR(:OLD.DEPTNUMB));
DBMS_OUTPUT.PUT_LINE('OLD DEPTNAME: '||TO_CHAR(:OLD.DEPTNAME));
DBMS_OUTPUT.PUT_LINE('OLD LOCATION: '||TO_CHAR(:OLD.LOCATION));
DBMS_OUTPUT.PUT_LINE('NEW DEPTNUMB: '||TO_CHAR(:NEW.DEPTNUMB));
DBMS_OUTPUT.PUT_LINE('NEW DEPTNAME: '||TO_CHAR(:NEW.DEPTNAME));
DBMS_OUTPUT.PUT_LINE('NEW LOCATION: '||TO_CHAR(:NEW.LOCATION));
END;
/
