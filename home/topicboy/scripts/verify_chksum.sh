#!/bin/bash
RED='\033[0;31m' # Red
GRN='\033[0;32m' # Green
YLW='\033[0;33m' # Yellow
echo -e "SYNTAX: verify.sh protocol(sha256/md5) filename hash-file"
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
FILE=$(${1}sum $2)
HASH=$(cat $3)
echo -e "FILE: $FILE"
echo -e "HASH: $HASH"
	if [ "$FILE" == "$HASH" ]; then
		echo -e "${GRN}>>> file matches hash!"
		exit 0
	else
		echo -e "${RED}>>> file-hash mismatch!"
		exit 0
	fi
exit
