#!/bin/bash

XINPUT_PRINT=$(xinput | grep 'Logitech USB' $xinput)
TOUCHPAD_ID=$(xinput | grep -oP '(?<=SynPS/2 Synaptics TouchPad).*' | awk '{print $1}' | grep -oP '(?<=id=).*')

# TEST: VAR != EMPTY / Mouse Connected
if [ -n "$XINPUT_PRINT" ];
then
	# DISABLE
	$(xinput set-prop $TOUCHPAD_ID "Device Enabled" 0)
	echo "Disabling touchpad"
	#exit 0
else
	# ENABLE
	$(xinput set-prop $TOUCHPAD_ID "Device Enabled" 1)
	echo "Enabling touchpad"
	#exit 0
fi
