select b.ssn_sm,b.dob,b.name_ind,b.states_us,
                  u.uname,u.upc,
                  p.gr_abbr_code,p.date_rec_stat,
                  s.pay_gr,s.state_tax_code,
                  t.tng_stat,t.date_trans_proc,
                  w.occurs,w.wvr_cond
           from pers_person_tbl b, pers_unit_tbl u, pers_svcmbr_tbl p,
                   pers_svcmbr_pay_tbl s, pers_svcmbr_wvr_cond_tbl w,
                   pers_proc_trans_tbl t
           where b.ssn_sm between :lowssn and :highssn
           and b.ssn_sm = p.ssn_sm and
           p.mpc=s.mpc and p.asg_seq_nbr=s.asg_seq_nbr and
           p.mpc=w.mpc and p.asg_seq_nbr=w.asg_seq_nbr and
           p.mpc=t.mpc and p.asg_seq_nbr=t.asg_seq_nbr and
           p.upc = u.upc
/
