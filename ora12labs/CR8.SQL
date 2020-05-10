CREATE TABLE external_STAFF (
 ID NUMBER(4),
 NAME  CHAR(11),
 DEPT  NUMBER(4),
 JOB  CHAR(5),
 SALARY NUMBER(7,2)
)
ORGANIZATION EXTERNAL (
type oracle_loader
DEFAULT DIRECTORY STAFF_LOAD
ACCESS PARAMETERS (
    RECORDS FIXED 50
    badfile staff_load: 'staff_ext.bad'
    logfile staff_load:'staff_ext.log'
    FIELDS
(
  id  CHAR(4),
  name char(11),
  dept    CHAR(2),
  job  char(5),
  salary CHAR(7)
)
)
location ('staff.dat')
)
PARALLEL 4
reject  limit unlimited
/
