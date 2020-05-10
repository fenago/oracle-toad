select * from staff
where salary > 20000 and
exists (select * from staff
where comm < 350)
/
