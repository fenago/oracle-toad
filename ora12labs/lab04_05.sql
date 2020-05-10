select decode(pay_gr,'O1','Second Lieutenant',
                     'O2','First Lieutenant',
                     'O3','Captain',
                     'O4','Major',
                     'O5','Lieutenant Colonel',
                     'O6','Colonel',
                     'O7','Brigadier General',
                     'O8','Major General',
                     'O9','Lieutenant General',
                     'O10','General',
                     'O11','General of the Army',
                     'No Rank') RANK,
                     pay_gr from pers_svcmbr_pay_tbl
                     where pay_gr in ('O1','O2','O3','O4',
                                      'O5','O6','O7','O8',
                                      'O9','O10','O11')
/
