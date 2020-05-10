SET LINESIZE 100
COLUMN value FORMAT A60

SELECT value
FROM   v$diag_info
WHERE  name = 'Default Trace File';