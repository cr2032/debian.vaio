#!/bin/bash

# START-VARIABLER
NETWORK_SSID=$(sudo iwconfig wlp1s0 | grep 'Gossamer' $iwconfig)

if [ -z "$LOGIN_STATUS" ]
	then
		sudo mount -t cifs -o credentials=/home/topicboy/.smbcredentials vers=1.0 uid=1000 gid=1001 //192.168.1.20/PLEX /media/PLEX
        sudo mount -t cifs -o credentials=/home/topicboy/.smbcredentials vers=1.0 uid=1000 gid=1001 //192.168.1.20/NODE /media/NODE
        sudo mount -t cifs -o credentials=/home/topicboy/.smbcredentials vers=1.0 uid=1000 gid=1001 //192.168.1.20/BACKUP /media/BACKUP
fi