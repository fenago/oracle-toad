
## Oracle 12c

Global Database:    fenagodb
PDB:				fenagodb1

user: 				system
password: 			fenago




## Important

**Open Pluggable Database (if required)**

alter pluggable database fenagodb1 open;



Relevant to cr8toad1.sql script

Run this command first:

alter session set container=fenagodb1;

https://stackoverflow.com/questions/33330968/error-ora-65096-invalid-common-user-or-role-name-in-oracle/33331148