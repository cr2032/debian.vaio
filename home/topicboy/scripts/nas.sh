#!/bin/bash

# START-VARIABLER
is_gossamer=$(sudo iwconfig wlp1s0 | grep 'Gossamer' $iwconfig)

if [ -n "$is_gossamer" ]
	then
		sudo mount -t cifs -o cred=/home/topicboy/.smbcredentials,vers=2.0,uid=1000,gid=1001,noperm //192.168.1.20/PLEX /media/PLEX
        sudo mount -t cifs -o cred=/home/topicboy/.smbcredentials,vers=2.0,uid=1000,gid=1001,noperm //192.168.1.20/NODE /media/NODE
        sudo mount -t cifs -o cred=/home/topicboy/.smbcredentials,vers=2.0,uid=1000,gid=1001,noperm //192.168.1.20/BACKUP /media/BACKUP
fi
