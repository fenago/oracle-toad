CREATE TYPE EMPLOYEE_TYPE AS OBJECT(
    name  varchar2(30),
    hire_date date,
    address address_type,
    member  procedure   give_raise);
/
