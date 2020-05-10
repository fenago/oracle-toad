select regexp_instr
('We are trying to make the subject easier.',
 'tr(y(ing)? | (ied) | (ies))')
 RESULTNUM from dual
/
