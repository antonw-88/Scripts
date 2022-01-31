# Script for compressing(tar) designated logs and sending the tar to specified destination
# Two different alternatives:
# 1. Simply mv the compressed logs to a different location on the filesystem
# 2. Send the compressed logs somewhere via scp

import os
from datetime import date

# 1 & 2. Universal variables
# Enter hardcoded path to each log, with single space in between:
logs_to_compress = "/home/anton/logsTest/test /home/anton/logsTest/test1 /home/anton/logsTest/test2"
# Enter hardcoded path where tar.gz should be stored prior to being sent to final destination:
tar_path = "/home/anton/logsTest/"
# Enter the tarball's name:
tar_name = ""
# Enter the tar compress command to be used:
compress_command = "tar -cvf"

# 1. Variables
# Enter command for sending via mv:
move_via_mv = "mv " + tar_path + tar_name + " /home/anton/logBackups" 
# Enter command for sending via scp:
move_via_scp = "scp " + tar_path + tar_name + " test@127.0.0.1:/home/test/logs"


def compress_files():
	print("Files are now being compressed into a .tar")
	os.system(compress_command + " " + tar_path + tar_name + " " + logs_to_compress)

def send_with_mv():
	print("Files are being moved - via 'mv' - to location on local system")
	os.system(move_via_mv)

def send_with_scp():
	print("Files are being moved - via 'scp' - to location on external system")
	os.system(move_via_scp)

if __name__ == '__main__':
	print("Enter name for log tarball (add .tar):")
	tar_name = input()
	today = date.today()
	date_time = today.strftime("%Y")
	tar_name += date_time
	print("Enter number to send compressed logs via scp or mv:\n 1. mv\n 2. scp")
	choice = input()
	compress_files()
	if choice == 1:
		send_with_mv()
	elif choice == 2:
		send_with_scp()
	


# Todo:
# Add full date to each tar
# Control for naming of tarball
