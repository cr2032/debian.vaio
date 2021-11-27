#!/bin/bash

### ~/scripts/backup.sh ###

## DIRS ##
vaio=/home/topicboy/git/github/debian10/VAIO
home=/root
vaio_home="$vaio$home"

#/home/topicboy/git/github/debian10/VAIO/root/

## BASH ##
shopt -s expand_aliases
source /root/.bashrc

## COPY ##

# crontab #
crontab -l >$vaio/crontab/crontab.bak

# sudoers #
install -DC /etc/sudoers $vaio/etc/

# sources.list #
install -DC /etc/apt/sources.list.d/* $vaio/etc/apt/sources.list.d/

# apt #
apt list --installed >/home/topicboy/Apt/installed.txt && chown topicboy:topicboy /home/topicboy/Apt/installed.txt

# bash files #
install -DC $home/.bash_aliases $vaio_home/.bash.bak/.bash_aliases."$(date '+%F')".bak
install -DC $home/.bash_aliases $vaio_home/
install -DC $home/.bashrc $vaio_home/.bash.bak/.bashrc."$(date '+%F')".bak
find $vaio_home/.bash.bak/ -mindepth 1 -mtime +14 -delete
install -DC $home/.bashrc $vaio_home/
install -DC /etc/profile $vaio/etc/
install -DC /etc/profile.d/* $vaio/etc/profile.d

# lightdm #
install -DC /etc/lightdm/lightdm.conf $vaio/etc/lightdm/

# scripts #
install -DC $home/.local/share/lscolors.sh $vaio_home/.local/share/

# permissions #
chown -R :git $vaio

## EOF ##
