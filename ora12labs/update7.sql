update staff
set salary = salary * 1.10
where years = (select max(years) from staff)