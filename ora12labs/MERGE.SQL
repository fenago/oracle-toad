MERGE into staff s1
 Using org o2 on (s1.dept = o2.deptnumb )
  When matched then update set s1.salary = :new_salary
  When not matched then insert
          (id,name,dept,years,job,salary,comm)
  Values (:new_id,:new_name,:new_dept,:new_years,:NEW_JOB,
    :new_salary,:new_comm)
/
