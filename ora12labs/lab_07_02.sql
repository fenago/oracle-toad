select pu.uname,  -- lab_07_02.sql
       pe.ssn_sm,
       pe.name_ind, 
       pe.yr_mo_last_phys_ex,
       ps.cum_ret_pt,
       pg.pay_gr,
       pe.depn_nbr
from pers_person_tbl pe, pers_svcmbr_tbl ps,
     pers_unit_tbl pu,pers_svcmbr_pay_tbl pg
where pe.ssn_sm = ps.ssn_sm 
  and pe.rec_prec = ps.rec_prec 
  and pu.upc = ps.upc 
  and ps.mpc = pg.mpc 
  and ps.asg_seq_nbr = pg.asg_seq_nbr
/
