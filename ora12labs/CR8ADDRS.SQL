create type address_type as object  (
    street  varchar2(40),
    city  varchar2(30),
    state  varchar2(2),
    zip_code number(5))
/
