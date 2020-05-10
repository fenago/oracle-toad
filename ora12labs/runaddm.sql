declare
 task_id   number;
begin
dbms_advisor.create_task('ADDM',task_id,:task_name);
dbms_advisor.set_task_parameter(:task_name,'START_SNAPSHOT',355);
dbms_advisor.set_task_parameter(:task_name,'END_SNAPSHOT',342);
dbms_advisor.execute_task(:task_name);
end;
/
