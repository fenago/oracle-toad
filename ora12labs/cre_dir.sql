REM  login to teach_b account 

DROP DIRECTORY emp_dir;
CREATE OR REPLACE DIRECTORY emp_dir as '<specify path here>/EMP_DIR';

grant read on   emp_dir to PUBLIC;