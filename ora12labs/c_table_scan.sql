
select b.ssn_sm,b.dob,b.name_ind,b.states_us,
                  u.uname,u.upc,p.gr_abbr_code,p.date_rec_stat
           from big_person b, pers_unit_tbl u, pers_svcmbr_tbl p
           where b.ssn_sm = p.ssn_sm and
           p.upc = u.upc
/

