 Select name, 
salary,
 comm,
 (salary + comm) * .10
 from staff
 where comm > (salary + comm) * .10
/
