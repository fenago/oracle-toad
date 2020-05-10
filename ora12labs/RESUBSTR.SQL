SELECT REGEXP_SUBSTR(cust_email, '[^@]+')
FROM   oe.customers
WHERE  nls_territory = 'SWITZERLAND' ; 