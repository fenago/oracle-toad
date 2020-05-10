Rem  MORE_EMP to expand the size of the S_EMP table.
Rem

INSERT INTO scott.emp SELECT * FROM scott.emp where rownum < 5;
COMMIT;
ALTER SYSTEM SWITCH LOGFILE;
INSERT INTO scott.emp SELECT * FROM scott.emp where rownum < 5;
COMMIT;
ALTER SYSTEM SWITCH LOGFILE;
INSERT INTO scott.emp SELECT * FROM scott.emp where rownum < 5;
COMMIT;
ALTER SYSTEM SWITCH LOGFILE;
COMMIT;
update scott.emp set salary = salary + 1;
COMMIT;
ALTER SYSTEM SWITCH LOGFILE;
select count(*) from scott.emp;   
