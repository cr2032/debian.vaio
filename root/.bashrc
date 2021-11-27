# ~/.bashrc: executed by bash(1) for non-login shells.

# sources /etc/profile
source /etc/profile

# Note: PS1 and umask are already set in /etc/profile. You should not need this unless you want different defaults for root.
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h:\[\033[01;34m\]\w\[\033[00m\]\$ '
#umask 022

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# CUSTOM LS_COLORS (ORG = $LS_COLORS_ORG)
. /root/.local/share/lscolors.sh

# PATH
export PATH=/root/scripts:$PATH

# WELCOME!
clear
