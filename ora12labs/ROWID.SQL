select rowid,substr(rowid,15,4) "FILE #",
                substr(rowid,1,8)  "Block",
                substr(rowid,10,4) "Row"
                from staff
/
