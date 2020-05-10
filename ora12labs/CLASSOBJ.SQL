create or replace type ClassObj as OBJECT (
 department  char(3),
 course      number(3),
 description varchar2(200),
 max_students number(3),
 current_students number(3),
 num_credits      number(1),
 room             REF RoomObj
)
/
