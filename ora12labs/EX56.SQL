select deptnumb,manager,location,substr(location,1,instr(location,' ')),length(substr(location,1,instr(location,' ')))
from org
where substr(location,length(substr(location,1,instr(location,' ')))-3,instr(location,' ')) = 'TON'
/
