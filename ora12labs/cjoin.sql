select p.name_ind, p.ssn_sm, cum_ret_pt
              from pers_person_tbl p left outer join pers_svcmbr_tbl a
              on p.ssn_sm = a.ssn_sm and p.rec_prec=a.rec_prec
              where p.ssn_sm not in (select ssn_sm from pers_svcmbr_tbl)
/
