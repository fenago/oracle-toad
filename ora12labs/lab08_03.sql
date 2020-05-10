select mpc, asg_seq_nbr, state_tax_code, pay_gr, 'Pay Grade E7' "Pay Grade"
from pers_svcmbr_pay_tbl
where pay_gr='E7'
union all
select mpc, asg_seq_nbr, state_tax_code, pay_gr, 'Pay Grade E8'
from pers_svcmbr_pay_tbl
where pay_gr='E8'
union all
select mpc, asg_seq_nbr, state_tax_code, pay_gr, 'Pay Grade E9'
from pers_svcmbr_pay_tbl
where pay_gr='E9'
/
