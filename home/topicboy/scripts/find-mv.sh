#!/bin/bash

find ./ -name $1 -exec mv {} $2 \;
exit 0

#echo -n "Enter some text > "
#read text
#echo "You entered: $text"

