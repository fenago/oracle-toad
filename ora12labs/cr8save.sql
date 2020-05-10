CREATE PROCEDURE save_output AS
lines DBMS_OUTPUT.CHARARR;
numlines INTEGER;
 loopvar BINARY_INTEGER;
BEGIN
numlines := 100;   --  an arbitrary number
--get (up to) 100 lines of output from buffer…
DBMS_OUTPUT.GET_LINES(lines, numlines);
Loopvar := lines.FIRST;
WHILE loopvar IS NOT NULL LOOP
--loop through PL/SQL table and insert messages
--into the audit trail table…
INSERT INTO audit_messages
(line_num, message, msg_date)
  VALUES
(loopvar, lines(loopvar), SYSDATE);
loopvar := lines.NEXT(loopvar);
                      -- get next idx value
   END LOOP;
END save_output;
/
