create database ora9i21
controlfile reuse
logfile group 1 ('$HOME/9i21log1a.log','$HOME/9i21log1b.log') size 2m reuse,
group 2 ('$HOME/9i21log2a.log','$HOME/9i21log2b.log') size 2m reuse
 datafile '$HOME/9i21sys.dbf' size 120m reuse autoextend on;
