select deptnumb,manager,location,substr(location,1,instr(location,' ')) SUBSTRING,length(substr(location,1,instr(location,' '))) LENGTH,
substr(location,length(substr(location,1,instr(location,' ')))-3),
length(substr(location,length(substr(location,1,instr(location,' ')))-3))
from org
--where substr(location,length(substr(location,1,instr(location,' ')))-3,instr(location,' ')) = 'TON'
/
