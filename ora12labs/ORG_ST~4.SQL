CREATE OR REPLACE TRIGGER OS_TRIG
BEFORE UPDATE OF DEPTNUMB ON ORG
FOR EACH ROW
BEGIN
UPDATE STAFF
SET DEPT = :NEW.DEPTNUMB
WHERE DEPT = :OLD.DEPTNUMB;
END;
/
