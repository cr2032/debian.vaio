#!/bin/bash

touchpad_id=$(xinput | grep -oP '(?<=SynPS/2 Synaptics TouchPad).*' | awk '{print $1}' | grep -oP '(?<=id=).*')
touchpad_status=$(xinput list-props $touchpad_id | grep -oP '(?<=Device Enabled).*' | awk '{print $2}')

if [ $touchpad_status == 1 ];
then
    xinput disable $touchpad_id
    exit 0
else
    xinput enable $touchpad_id
    exit 0
fi
