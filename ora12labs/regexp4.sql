select regexp_instr
('500 Oracle Pkwy, Redwood Shores, CA',
 '[o][[:alpha:]]{3}',1,2,1,'i')
 RESULT from dual
/
