var dept number
var name varchar2(11)
begin
 select name,dept,job 
into :name,:dept,:job
from staff where id = &an_id and job = '&a_job';
end;
/
