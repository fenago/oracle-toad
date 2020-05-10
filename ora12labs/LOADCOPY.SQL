INSERT INTO copy
SELECT isbn
     , MYinteger
     , title_no
     , 'N'
FROM item, integer_table
WHERE MYinteger <= :max_copies
/
