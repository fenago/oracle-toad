CREATE OR REPLACE TRIGGER HEADCOUNT
 AFTER INSERT OR DELETE OR UPDATE OF DEPTNO
 ON EMP
 FOR EACH ROW
 BEGIN
   IF INSERTING THEN
   UPDATE DEPT
   SET HC  = HC + 1
   WHERE DEPTNO  = :NEW.DEPTNO;
  ELSIF
   DELETING THEN
	UPDATE DEPT
   Set  hc    =   hc - 1
   WHERE  deptno = :old.deptno;
  ELSE
   UPDATE  dept
   Set hc   =  hc -1
   Where deptno = :old.deptno;
   UPDATE  dept    --  increment New Dept
   Set  hc   =  hc + 1
   WHERE deptno   =  :new.deptno;
  END IF;
 END;
/
