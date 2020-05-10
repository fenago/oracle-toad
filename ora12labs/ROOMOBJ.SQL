CREATE OR REPLACE TYPE Room2Obj AS OBJECT (
 ID             number(5),
 building        varchar2(15),
 room_number    number(4),
 number_seats   number(4),
 description    varchar2(50),
 MEMBER PROCEDURE Print,
MAP MEMBER FUNCTION ReturnID RETURN NUMBER
);
/
