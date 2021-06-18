#!/bin/bash

#exec 1>logger -s -t $(basename $0)) 2>&1


#Author: Anton Wiklund -19880905
 
#Functionality example - change all file-extensions in current directory, from *.txt to *.text:
#sh ./change_ext txt text

#if no arguments; then warning
if [ $# -eq 0 ]; then
  logger -s -i -p syslog.err -t $0 "ERROR: No input-arguments provided. Arguments are necessary in order to determine new file-extension." &>/dev/null
  exit 1
fi

#Loop through every occurence of files with a specified file-extension 
for file in *$1; do
  if [ "*$fileName$1" == "$file" ]; then
    logger -s -i -p syslog.warning -t $0 "WARNING: All of the file-extensions in the directory are already of the kind '$2'." &>/dev/null
  else
    fileName=$(basename $file $1); #Use basename in order to identify files with the specified file-extension
    mv $fileName$1 $fileName$2; #Use mv in order to change the file-extension
    logger -s -i -p syslog.info -t $0 "INFO:" "'$filename$1'" "file-ending for $file was changed to" "'$filename$2'" &>/dev/null
  fi
done

# Description of logger-flags:
# -i : logs the PID
# -p : logs the error-priority(3 error; 4 warning; 6 info; etc). Can also set detailed facility and level : -p syslog.error
# -s : output to stderr and system log
# -t $0 : tag the logging instance with the script's name
