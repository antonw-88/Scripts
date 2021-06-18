#! /bin/bash

#Path-variables
filesListPath="/home/anton/customLogs/filesList.txt"
logLocation="/home/anton/customLogs/"

#Set if should use input from file or command to monitor files
if [ $# -eq 1 ]; then
	filesListVar=$1
	echo $1
elif [ $# -eq 0 ]; then
	filesListVar=`cat $filesListPath`
else
	echo "Maximum one extra argument: monitorFiles.sh exampleFileToMonitor"	
	exit 1
fi

#Set $? to -notequal 0
$? > /dev/null 2>&1
#Monitor, once per second, if the files are accessed.
while [ $? -ne 0 ]; do
	sleep 1
	lsof | grep $filesListVar
done

#Print lsof info to honeyPotLog.txt
date >> $logLocation'honeypotLog.txt'
lsof | grep $filesListVar >> $logLocation'honeypotLog.txt'

#Print name of intruding user-account to monitorUsers.txt
date >> $logLocation'monitorUsers.txt'
awk 'END{print $3}' $logLocation'honeypotLog.txt' >> $logLocation'monitorUsers.txt' 

#Print intruding user-account's all open files to openFiles.txt
user=`awk 'END{print}' $logLocation'monitorUsers.txt'`
date >> $logLocation'openFiles.txt'
lsof -u $user >> $logLocation'openFiles.txt'

logNotify=`awk 'END{print}' $logLocation'honeypotLog.txt'`
notify-send -u critical Intrusion-Warning "2fa honeytoken Notification. User: $user \n $logNotify"

echo $filesListVar
