create database oracle
controlfile reuse
logfile group 1 ('jerlog1a.log','jerlog1b.log') size 1m reuse,
group 2 ('jerlog2a.log','jerlog2b.log') size 1m reuse
 datafile 'c:\oracle8i\jersys.dbf' size 60m reuse;
