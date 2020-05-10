create trigger comm_check
/* Triggering event */
after update of comm on staff
for each row
/* Trigger constraint */
when (new.job <> 'SALES')
begin
if (:old.comm is null) then
insert into exception_table (message)
     values(:new.name||'invalid amount on check');
end if;
end;
/
