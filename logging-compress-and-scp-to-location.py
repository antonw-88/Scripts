# Script for compressing(tar) designated logs and sending the tar to specified destination
# Two different alternatives:
# 1. Simply mv the compressed logs to a different location on the filesystem
# 2. Send the compressed logs somewhere via scp

# 1 & 2. Universal variables
# Enter hardcoded path to each log, with single space in between:
logs_to_compress = "/home/anton/logsTest/test"
# Enter hardcoded path where tar.gz should be stored prior to being sent to final destination:
tar_path = "/home/anton/logsTest"
# Enter the tarball's name:
tar_name = "logs.tar.gz"
# Enter the compress command to be used:
compress_command = "tar -cvf"

# 1. Variables
# Enter command for sending logs to backup location:
move_to_dest_command = "mv " + tar_path + tar_name + " /home/anton/logBackups" 

# 2. Variables

import os

def compress_files():
	print("Files are now being compressed into a tar.gz")
	os.system(compress_command + " " + tar_path + tar_name + " " + logs_to_compress)

def send_with_mv():
	print("Files are being moved to location")
	os.system(move_to_dest_command)

def send_with_scp():
	print('test')

if __name__ == '__main__':
	print("Enter number to send compressed logs via scp or mv:\n 1. mv\n 2. scp")
	choice = input()
	compress_files()
	if choice == 1:
		send_with_mv()
	elif choice == 2:
		send_with_scp()




# Todo:
# Add date to each tar
