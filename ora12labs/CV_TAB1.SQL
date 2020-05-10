 DECLARE
    TYPE t_NumbersTab IS TABLE OF NUMBER;
    /*  Create a table with one element */
      v_Tab1    t_NumbersTab  := t_NumbersTab(-1);
   /*  Create a table with five elements  */
      v_Primes t_NumbersTab  :=  t_NumbersTab (1,2,3,8,11);
    /*  Create a table with no elements   */
       v_Tab2 t_NumbersTab  := t_NumbersTab();
 BEGIN
    /*  Assign to v_Tab1(1). This will replace the 
     value already in v_Tab(1) which */
    /* was initialized to -1. */
     V_Tab1(1) := 120000;
 END;
/
