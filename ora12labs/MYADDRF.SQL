 DECLARE
    myaddress  myaddressobj := myaddressobj(
                             '103 OCEAN DR',
                             NULL,
                             'DETROIT',
                             'TX');
  BEGIN
  myaddress.state := 'MI';
  END;
/
