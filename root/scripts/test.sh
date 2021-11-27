#!/bin/bash

if [ $(id -u) != 0 ]; then
	echo 'not root!'
else
	echo 'root!'
fi
