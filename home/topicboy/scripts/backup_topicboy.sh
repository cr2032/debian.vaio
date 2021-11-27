#!/bin/bash

### ~/scripts/backup.sh ###

## DIRS ##
vaio=/home/topicboy/git/github/debian.vaio
home=/home/topicboy
vaio_home="$vaio$home"
mega=/home/topicboy/MEGA/VAIO
mega_home="$mega$home"

## BASH ##
shopt -s expand_aliases
source /home/topicboy/.bashrc
source /etc/profile
eval $(ssh-agent)

#if ps -p $SSH_AGENT_PID > /dev/null
#then
ssh-add ~/.ssh/BACKUP_ed25519
#else
#	eval `ssh-agent -s`
#fi

## COPY ##

# vs code user settings.json #
install -DC $home/.config/Code/User/settings.json $vaio_home/.config/Code/User/

# crontab #
crontab -l >$vaio/crontab/crontab_topicboy.bak

# bash files #
install -DC $home/.bash_aliases $vaio_home/.bash.bak/.bash_aliases."$(date '+%F')".bak
install -DC $home/.bash_aliases $vaio_home/
install -DC $home/.profile $vaio_home/
install -DC $home/.bashrc $vaio_home/.bash.bak/.bashrc."$(date '+%F')".bak
find $vaio_home/.bash.bak/ -mindepth 1 -mtime +14 -delete
install -DC $home/.bashrc $vaio_home/

# apt #
install -DC $home/Apt/installed.txt $home/Apt/installed_old/installed."$(date '+%F')".txt
find $home/Apt/installed_old/ -mindepth 1 -mtime +14 -delete

# nautilus #
install -DC $home/.config/user-dirs.dirs $vaio_home/.config/

# home #
rsync -a --delete $home/Apt/ $vaio_home/Apt/
rsync -a --delete $home/Debs/ $mega_home/Debs/
rsync -a --delete $home/Icons/ $mega_home/Icons/

# scripts #
rsync -a --delete $home/scripts/ $vaio_home/scripts/
install -DC $home/.local/share/lscolors.sh $vaio_home/.local/share/

# ssh keys #
#if [ ! -e $home/.ssh/SSH_keys.tar.gz.gpg ]; then
#    encrypt-gpg-tar.sh $home/.ssh/VAIO_ed25519 $home/.ssh/VAIO_ed25519.pub $home/.ssh/BACKUP_ed25519 $home/.ssh/BACKUP_ed25519.pub $home/.ssh/config $home/.ssh/SSH_keys
#    cp -p $home/.ssh/SSH_keys.tar.gz.gpg $vaio_home/.ssh/
#fi

## GIT PUSH ##
cd $vaio
rm -f ./home/topicboy/scripts/.backup.sh.swp ./home/topicboy/scripts/..bash_aliases.swp
gogit backup.sh
rm -f ~/scripts/..bash_aliases.swp

## CRON REPORT ##
if [ "$1" = "cron" ]; then
	echo "crontab $(date '+%F %T')" >> /home/topicboy/scripts/backup_topicboy.log
fi

## EOF ##
