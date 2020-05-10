# the parameter to thris script sets the transactions per second of the load
# example for 40 tps: ./lab_04_02_04.sh 40

touch /home/oracle/workshops/runload

./wkld_sess.sh jfv jfv orcl lab_04_02_04 $1 1 &
