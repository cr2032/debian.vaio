#!/bin/bash

## PROMPT ##
Is ssh key imported with ssh-add?

# install #
sudo apt update
sudo apt upgrade
sudo apt install curl git nautilus ca-certificates gnupg gtk2-engines-murrine \
gtk2-engines-pixbuf filezilla menulibre tor

# groups, access, bash, etc #
cd /home/topicboy
sudo mkdir scripts/ && \
	sudo chown topicboy ./scripts/ &&
sudo mkdir -r ./git/github/ && \
	sudo chown -r topicboy /home/topicboy/git/github &&
sudo mkdir ./git/bitbucket && \
	sudo chown topicboy ./git/bitbucket
sudo - &&
adduser sudo topicboy &&
adduser adm topicboy &&
adduser ssh topicboy &&
echo "copy string: topicboy ALL=NOPASSWD:/bin/mkdir,/bin/chmod" && wait 20
visudo -e &&
- edit ~/.bashrc (saved to .bashrc.org)
- touch & edit ~/.bash_aliases
