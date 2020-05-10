insert into person_part
           select ssn_sm,rec_prec,areax,name_ind,
                  type_addr,states_us,to_date(dob,'yyyymmdd')
                  from pers_person_tbl
/
