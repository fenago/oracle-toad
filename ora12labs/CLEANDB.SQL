connect / as sysdba;
shutdown abort
!
cd $HOME/DATA
# remove the archived log files
rm -f $HOME/ARCHIVE/arch*
rm -f $HOME/ARCHIVE2/arch*
# Place the database back to the time it was at Lesson 6.
# The database should be in archivelog mode
cp -rp $HOME/DONTOUCH/* $HOME/DATA
exit
startup pfile=$HOME/DATA/initDBxx.ora
