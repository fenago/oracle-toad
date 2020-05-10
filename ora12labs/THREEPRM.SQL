CREATE OR REPLACE PROCEDURE THREE_PARM
    (CHARIN in VARCHAR2, CHAROUT OUT VARCHAR2, aNum number :=7)
    as
    local_var varchar2(50);
    begin
    local_var := charin||' '||to_char(aNum);
    dbms_output.put_line('THE OUTPUT PARM IS'||TO_CHAR(aNum));
    charout := local_var;
   end THREE_PARM;                                  
