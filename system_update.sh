#!/bin/bash

sudo apt update && sudo apt upgrade -y

if [ $? -ne 0 ];
then
	echo "Running dpkg to fix the issue"
	sudo dpkg --configure -a
fi
