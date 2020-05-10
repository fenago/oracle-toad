BEGIN
  INSERT INTO comp.stfhistory (dcn,seq,pm,sof,fy,ssn_5)
      select substr(rec_prec,1,5),
asg_seq_nbr,afqt_pctl,mpc,substr(rec_prec,1,4),substr(ssn_sm,1,5)
from pers_svcmbr_tbl;
END;

