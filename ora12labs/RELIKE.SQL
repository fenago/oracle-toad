select product_name
  from oe.product_information
  where regexp_like (product_name, 'SS[PS]/[VS]');