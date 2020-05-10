select to_char(line)||'/'||to_char(position) line_pos,
text from user_errors
where name = upper('&proc')
/
