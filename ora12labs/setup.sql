REM  Script:  setup.sql
REM  Created: By Chaitanya Koratamaddi on 02/05/06
REM  This script creates users ora1-40,teach_a and teach_b
--Please repalce the password for 'SYS'if it is different.

connect sys/oracle as sysdba

@@create_users1-40.sql
@@create_tables.sql
@@creteach_a.sql
@@creteach_b.sql
