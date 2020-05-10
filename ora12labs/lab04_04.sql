select substr(name_ind,1,instr(name_ind,'  ',1)-1) "LAST NAME",
                     dob, to_char(To_date(dob,'YYYYMMDD'),'DAY') day
             from pers_person_tbl
             where ssn_sm < '100551234'
/
