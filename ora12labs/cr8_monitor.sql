CREATE VIEW dba_object_usage (owner,
index_name, table_name, monitoring, used, start_monitoring, end_monitoring )
AS
SELECT do.owner, io.NAME, t.NAME,
DECODE (BITAND (i.flags, 65536), 0, 'NO', 'YES'),
DECODE (BITAND (ou.flags, 1), 0, 'NO', 'YES'), ou.start_monitoring,
ou.end_monitoring
FROM SYS.obj$ io,
SYS.obj$ t,
SYS.ind$ i,
SYS.object_usage ou,
dba_objects do
WHERE i.obj# = ou.obj#
AND io.obj# = ou.obj#
AND t.obj# = i.bo#
AND ou.obj# = do.object_id
/
