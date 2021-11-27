#!/bin/bash

source /usr/local/bin/bash_colors

# VARS
NETWORK_SSID=$(sudo iwconfig wlp1s0 | grep 'Gossamer' $iwconfig)
VPN_STATUS_PRE=$(protonvpn-cli s | grep 'No active ProtonVPN connection')
#LOGIN_STATUS=$(protonvpn-cli login | grep 'You are already logged in.')

#if [ -z "$LOGIN_STATUS" ]; then
#    protonvpn-cli login -u $PROTONVPN_USER -p $PROTONVPN_PW
#fi

if [ "$1" == "s" ]; then
	echo -ne "${ICY}" && protonvpn-cli s | grep -E 'Server:|Connection time:'
    exit 0
fi

if [ "$1" == "t" ] && [ -n "$VPN_STATUS_PRE" ]; then
    ech
    o "Connecting to VPN..."
    protonvpn-cli c -f
    VPN_STATUS_POST=$(protonvpn-cli status | grep 'Status: Connected')
    if [ -z "$VPN_STATUS_POST" ]; then
        echo "Connected!"
        exit 0
    else
        echo "Connection failed!"
        exit 1
    fi
fi

if [ "$1" == "t" ] && [ -z "$VPN_STATUS_PRE" ]; then
    echo "Disconnecting from VPN..."
    protonvpn-cli d
    VPN_STATUS_POST=$(protonvpn-cli status | grep 'Status: Connected')
    if [ -n "$VPN_STATUS_POST" ]; then
        echo "Disconnected!"
        exit 0
    else
        echo "Disconnection failed !"
        exit 1
    fi
fi

if [ -z "$NETWORK_SSID" ] && [ -n "$VPN_STATUS_PRE" ]; then
    echo "Connecting to VPN..."
    protonvpn-cli c -f
    VPN_STATUS_POST=$(protonvpn-cli status | grep 'Status: Connected')
    if [ -z "$VPN_STATUS_POST" ]; then
        echo "...success !"
        exit 0
    else
        echo "...failed !"
        exit 1
    fi
elif [ -n "$NETWORK_SSID" ] && [ -z "$VPN_STATUS_PRE" ]; then
    echo "Disconnecting from VPN..."
    protonvpn-cli d
    VPN_STATUS_POST=$(protonvpn-cli status | grep 'Status: Connected')
    if [ -z "$VPN_STATUS_POST" ]; then
        echo "...success !"
        exit 0
    else
        echo "...failed !"
        exit 1
    fi
else
    echo "Leaving VPN as-is !"
    exit 1
fi
