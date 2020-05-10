COLUMN non_alpha FORMAT 9999999999
SELECT product_name, REGEXP_INSTR(product_name, '[^[:alpha:]]') non_alpha
FROM   oe.product_information ;