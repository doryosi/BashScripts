#!/bin/bash
#Vars#
script_basedir=$(dirname $0)
dir_content=$(ls /home/smb/Backups/)
backup_dir="/home/smb/Backups/" 
netplan_file="/etc/netplan/00-installer-config.yaml"
new_netplan_file_name="00-installer-config-$(date +"%d-%m-%Y-%N").yaml"

if [ -n "${dir_content}" ]
then
	echo "removing the following files: ${dir_content}" 
	rm ${backup_dir}*
fi

echo #################################################
echo "Performing backup to ${netplan_file}" 
echo #################################################
cp ${netplan_file} ${backup_dir}${new_netplan_file_name}

if [ $? -eq 0 ]
then
	echo "Backup has been performed successfully"
	echo "the backup file is: $(ls ${backup_dir})"
fi



