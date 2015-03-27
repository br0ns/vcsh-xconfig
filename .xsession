#!/bin/bash

[ -f ~/.profile ] && . ~/.profile

xset b off

eval $(ssh-agent)

autocutsel -fork
autocutsel -fork PRIMARY

xfce4-volumed &
/usr/lib/x86_64-linux-gnu/xfce4/notifyd/xfce4-notifyd &

xscreensaver -nosplash &

xmodmap ~/.xmodmap
setxkbmap us -variant altgr-intl -option compose:prsc,compose:menu,nodeadkeys,terminate:ctrl_alt_bksp

xcompmgr &
exec .cabal/bin/xmonad
