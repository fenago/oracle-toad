archivemove.sh
#!/bin/sh
 
 
echo ----------------------------------------------------------------
echo ----------------------------------------------------------------
echo Get what log has last been applied to: $ORACLE_STANDBY
echo ----------------------------------------------------------------
sqlplus /nolog @getrecid.sql $ORACLE_STANDBY
echo ----------------------------------------------------------------
maxval=`tail -1 recid.log`
echo maxval=$maxval
rm recid.log
echo ----------------------------------------------------------------
 
# Check source drive to see what we're missing locally (source = primary)
for filename in `remsh $SOURCE_HOST 'ls $SOURCE_DRIVE' | sort`
do
	# get archive number. 
	# WARNING here I'm based on MY archived redo log name format! Put yours for the cut
	filename_parsed=`echo $filename | cut -c12-16`
	# Check if the number is after the last one applied to standby
 	if [ $filename_parsed -gt $maxval ]
 	then
 		# grab it!
 		echo $filename
 		rcp $SOURCE_HOST:$SOURCE_DRIVE/$filename $LOCAL_ARC_PARTH
 	fi
done
 
echo ----------------------------------------------------------------
echo Removing old files
echo ----------------------------------------------------------------
# Check in local directory
for filename in `ls $LOCAL_ARC_PATH | sort`
do
	# WARNING again about filename format
	filename_parsed=`echo $filename | cut -c12-16`
	# Check the arc number...
 	if [ $filename_parsed -lt `expr $maxval - 15` ]
 	then
 		# Delete it!
 		echo $filename
 		rm -f $LOCAL_ARC_PATH/$filename 
 	fi
done
 
echo ----------------------------------------------------------------
echo end archivemove.sh
echo ----------------------------------------------------------------


