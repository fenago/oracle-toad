CREATE OR REPLACE TRIGGER OLD_NEW_TRIG
BEFORE
UPDATE ON ORG
FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('OLD DEPTNUMB: '||TO_CHAR(:OLD.DEPTNUMB));
DBMS_OUTPUT.PUT_LINE('NEW DEPTNUMB: '||TO_CHAR(:NEW.DEPTNUMB));
END;
/
