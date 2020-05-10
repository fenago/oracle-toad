insert into personnel(ssn#,middle_initial,first_name,dob)
select ssn_sm,substr(name_ind,instr(name_ind,' ')+2,2),
              substr(name_ind,1,instr(name_ind,' ')),
              sysdate from person
/
