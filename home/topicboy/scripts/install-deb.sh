#!/bin/bash

source /usr/local/bin/bash_colors

sudo gdebi $1 &&
  mv $1 /home/topicboy/debs/
if [ -f /home/topicboy/debs/$1 ];then
	echo -e "${YLW}$1${WHT} installed using gdebi and moved to ${YLW}/home/topicboy/debs/$1"
	exit 0
	else
	echo -e "${RED}failed!"
	exit 1
fi
