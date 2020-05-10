create table course_material
 ( department  char(3),
   course      number(3),
   required_reading   Booklist)
   nested table required_reading store as required_tab
/
