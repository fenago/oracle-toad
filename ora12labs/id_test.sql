-- accept local_id prompt 'Please enter an Employee ID > '
select * from staff where id = &local_id;
select dept,name,salary from staff
where dept > &local_id
/
