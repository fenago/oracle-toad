{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fswiss\fcharset0 Courier New;}{\f1\froman\fcharset0 Times New Roman;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red255\green0\blue0;}
{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\tx0\tx959\tx1918\tx2877\tx3836\tx4795\tx5754\tx6713\tx7672\tx8631\b\f0\fs20 recover.sh\b0\par
#!/bin/sh\line  \line echo ----------------------------------------------------------------\line echo Traitement de la base $ORACLE_STANDBY\line echo ----------------------------------------------------------------\line sqlplus /nolog << EOF\line connect sys/$ORACLE_STANDBY_SYSDBA_PASS@$ORACLE_STANDBY as sysdba\line SELECT MAX(RECID) \cf1\f1 "Log id now"\cf0  FROM V\\$LOG_HISTORY;\line RECOVER AUTOMATIC DATABASE UNTIL CANCEL USING BACKUP CONTROLFILE\line CANCEL\line SELECT MAX(RECID) \cf1 "Log id after recover"\cf0  FROM V\\$LOG_HISTORY;\line exit;\line EOF\line echo ----------------------------------------------------------------\line echo End of recovery process\line echo ----------------------------------------------------------------\par
\pard\sb100\sa100\fs24\line\par
\pard\f2\fs20\par
}
 