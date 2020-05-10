
-- connected as user oracle

PIDLST=`cat /tmp/servwork_pids`

#
# Kill all these processes
#
for PID in $PIDLST; do
  echo "Killing stream with pid=$PID"
  sqlplus / as sysdba @$HOME/labs/kill_servwork.sql $PID >> /tmp/stop_servwork.log 2>&1
  sqlplus /nolog @/tmp/drop_servwork.sql >> /tmp/stop_servwork.log 2>&1
  kill -9 $PID >> /tmp/stop_servwork.log 2>&1
done


trcsess output=serv1_module1.trc service=SERV1 module=MODULE1 $ORACLE_BASE/admin/orcl/udump/*

tkprof serv1_module1.trc results.trc 

more results.trc
