update svcmbr_history s
              set end_date = (select dob + 10500
              from person p
              where s.ssn_sm = p.ssn_sm and
                   s.rec_prec = p.rec_prec)