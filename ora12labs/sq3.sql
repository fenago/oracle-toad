/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/
connect student1/student1

set echo on;


SELECT product_name, m_time, total_sales, sum(total_sales) 
over (partition by product_name order by m_time) total
from my_sales
right outer join my_time
using (m_time)
order by product_name,m_time;

set ech off;