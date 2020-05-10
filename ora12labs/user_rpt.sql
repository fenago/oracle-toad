REM
REM NAME        : DB_USER.SQL
REM
REM FUNCTION    : GENERATE USER_REPORT
REM Limitations : None
REM
REM Updates     : MRA 6/10/97 added Oracle8 account status
REM               MRA 5/14/99 Added Oracle8i Resource Group
REM               MRA 5/22/99 Removed expiry data to new report
REM
SET PAGESIZE 58  LINESIZE 131 FEEDBACK OFF
rem
COLUMN username                 FORMAT a12 HEADING User
COLUMN account_status           FORMAT a6  HEADING Status
COLUMN default_tablespace       FORMAT a14 HEADING Default
COLUMN temporary_tablespace     FORMAT a10 HEADING Temporary
COLUMN granted_role             FORMAT a22 HEADING Roles
COLUMN default_role             FORMAT a8  HEADING Default?
COLUMN admin_option             FORMAT a6  HEADING Admin?
COLUMN profile                  FORMAT a10 HEADING Profile
COLUMN initial_rsrc_consumer_group FORMAT a22 HEADING 'Resource|Group'
rem
START title132 'ORACLE USER REPORT'
DEFINE output = rep_out\&db\db_user
BREAK ON username SKIP 1 ON default_tablespace ON temporary_tablespace ON profile ON
account_status ON initial_rsrc_consumer_group
SPOOL &output
rem
SELECT a.username,
       a.default_tablespace,a.temporary_tablespace,
       a.profile,a.account_status,
       a.initial_rsrc_consumer_group,
       b.granted_role,b.admin_option,
       b.default_role
FROM sys.dba_users a,
     sys.dba_role_privs b
WHERE a.username = b.grantee
ORDER BY username,
         default_tablespace,
         temporary_tablespace,
         profile,
         granted_role;
rem
SPOOL OFF
SET TERMOUT ON FLUSH ON FEEDBACK ON VERIFY ON
CLEAR COLUMNS
CLEAR BREAKS
PAUSE Press Enter to continue
/
