select regexp_instr
('500 Oracle Pkwy, Redwood Shores, CA',
 '[o][[:alpha:]]{3}',1,2,0,'i')
 RESULT from dual
/
