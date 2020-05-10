SELECT name_ind, ssn_sm, states_us,areax
FROM   pers_person_tbl
WHERE  ssn_sm =  
                (SELECT ssn_sm
                 FROM   pers_svcmbr_tbl
                 WHERE  ssn_sm = '100196611')
AND    areax =
                (SELECT DISTINCT areax
                 FROM   pers_unit_tbl)
/
