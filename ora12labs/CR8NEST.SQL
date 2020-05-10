DECLARE
TYPE t_NumbersTab IS TABLE OF NUMBER;
v_Tab1   t_NumbersTab := t_NumbersTab(-1);
v_Primes  t_NumbersTab := t_NumbersTab(1,2,3,8,11);
v_Tab2   t_NumbersTab := t_NumbersTab();
BEGIN
v_Tab1(1) := 12000;
END;
/
