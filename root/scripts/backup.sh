#!/bin/bash

### ~/Scripts/backup.sh ###

## DIRS ##
vaio=/home/topicboy/Git/github/debian10/VAIO
home=/root/
vaio_home="$vaio$home"

#/home/topicboy/Git/github/debian10/VAIO/root/

## BASH ##
shopt -s expand_aliases
source /root/.bashrc
source /root/.bash_aliases

## COPY ##

	# crontab #
	crontab -l > $vaio/crontab/crontab.bak

	# bash files #
	install -DC $home/.bash_aliases $vaio_home/.bash.bak/.bash_aliases."$(date '+%F')".bak
	install -DC $home/.bash_aliases $vaio_home/
	install -DC $home/.bashrc $vaio_home/.bash.bak/.bashrc."$(date '+%F')".bak
	find $vaio_home/.bash.bak/ -mindepth 1 -mtime +14 -delete
	install -DC $home/.bashrc $vaio_home/

	# scripts #
	install -DC $home/Scripts/* $vaio_home/Scripts/

	# permissions #
	chown -R topicboy:topicboy	$vaio_home
## EOF ##
