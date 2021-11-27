#!/bin/bash
if [ "$1" == "-h" ]; then
  echo -e "Usage:\nSingle file, same output: 'encrypt-gpg-tar.sh FILENAME' \nSingle file, custom output: 'decrypt-gpg-tar.sh FILENAME OUTPUT' \nMultiple files: 'decrypt-gpg-tar.sh FILENAME-1 FILENAME-n OUTPUT'"
  exit 0
fi

if [ -n "$2" ]; then
	echo "multi arg"
	filelist=${*%${!#}} # all parameters except the last
	outputfile=${@:$#} # last parameter
	tar -cvzf - $filelist | gpg -c > $outputfile.tar.gz.gpg && exit 0
else
	echo "one arg"
	tar -cvzf - $1 | gpg -c > $1.tar.gz.gpg && exit 0
fi
