select name,phyrds,phywrts
from v$datafile d,v$filestat f
where d.file# = f.file#
/
