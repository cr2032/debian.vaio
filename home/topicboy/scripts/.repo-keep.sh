#/bin/bash

## marks packages as keep - won't be removed by apt autoremove
# list = 'libcrystalhd3 libmysofa0 libpulsedsp libspeexdsp1 pulseaudio-utils rtkit'
sudo apt-mark manual $(cat $1) -v && echo $1>>./package-keep.$now.log -v
# to undo  'sudo apt-mark auto $1'

