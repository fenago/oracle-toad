/*
** CONTROL.QRY
** This script sets up the remote access options for the sql server which
** controls login id creation for a pair of SQL Sservers.
**
** Instructions:
**   - Search for LOCALSERVER and replace with the local servername
**     (e.g. STUDENT1)
**   - Search for REMOTESERVER and replace with the remote servername
**     (e.g. STUDENT2)
**   - Use ISQL to run this script on the local server
*/

USE master
GO

IF EXISTS (SELECT * 
         FROM sysservers 
         WHERE srvname IN ("LOCALSERVER", "REMOTESERVER"))
BEGIN
  EXEC sp_dropserver "LOCALSERVER"
  EXEC sp_dropserver "REMOTESERVER"
END
GO

EXEC sp_addserver LOCALSERVER,local
EXEC sp_addserver REMOTESERVER
EXEC sp_configure "remote access", 1
EXEC sp_configure "remote logins", 2
EXEC sp_configure "remote sites", 2
EXEC sp_configure "remote connections", 2
GO

RECONFIGURE
GO
