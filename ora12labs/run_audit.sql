rem FRS 4-JUN-2009
rem
create table t_simple_user as select name, spare6 as last_login FROM user$;
rem
INSERT INTO t_simple_user 
(SELECT name, NULL FROM user$ 
WHERE name NOT IN (SELECT NVL(name,'  ') FROM t_simple_user));
rem
UPDATE t_simple_user u SET last_login = (
    SELECT max(timestamp)
    FROM dba_audit_session a
    WHERE a.username = u.name 
    AND a.timestamp = (select distinct max(b.timestamp) 
	FROM dba_audit_session b where a.username = b.username))
WHERE name IN (SELECT username FROM dba_audit_session);
commit;
/
