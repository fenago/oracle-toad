alter table reservation
add constraint fk_res_member foreign key (member_no)
references member
/
