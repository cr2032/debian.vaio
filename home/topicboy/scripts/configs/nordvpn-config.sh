#!/bin/bash
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh) &&
sudo nordvpn login
sudo nordvpn set technology NordLynx
sudo nordvpn set killswitch enable
sudo nordvpn set firewall enable
sudo nordvpn set notify enable
sudo nordvpn set cybersec enable
sudo nordvpn set autoconnect enable
sudo nordvpn c
