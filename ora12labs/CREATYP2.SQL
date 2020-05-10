/*
** CREATYP2.QRY
** Create the user defined data types.
** 
** Old versions of the types must be dropped before new versions can be 
** created.
** Don't forget to say 'USE asademo' first.
**
*/


USE asademo
GO



IF EXISTS ( SELECT name
            FROM systypes
            WHERE usertype >= 100
            AND name IN ( 'member_no',
                          'phonenumber',
                          'shortstring') )
BEGIN
    EXEC  sp_droptype  member_no
    EXEC  sp_droptype  phonenumber
    EXEC  sp_droptype  shortstring
End
GO

  

EXEC  sp_addtype  member_no,   'smallint'
EXEC  sp_addtype  phonenumber, 'char(13)'
EXEC  sp_addtype  shortstring, 'varchar(15)'
GO


/*
** Did it work.
*/

SELECT name
FROM systypes
WHERE usertype >= 100
ORDER BY usertype

GO
