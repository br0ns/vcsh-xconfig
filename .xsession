#!/bin/bash

# Set up environment
[ -f ~/.profile ] && . ~/.profile

# Turn bell off
xset b off

# Start the WM
.cabal/bin/xmonad &
WMPID=$!

# Desktop background
feh --bg-scale ~/.wallpaper.jpg

# Make the clipboard a little bit more sane
autocutsel -fork
autocutsel -fork PRIMARY

# Start a bunch of programs
eval $(ssh-agent)
xfce4-volumed &
/usr/lib/x86_64-linux-gnu/xfce4/notifyd/xfce4-notifyd &
gnome-do &
xscreensaver -nosplash &
xcompmgr &

# Keyboard stuff
setxkbmap us -variant altgr-intl -option compose:prsc,compose:menu,nodeadkeys,terminate:ctrl_alt_bksp
xmodmap ~/.xmodmap

wait $WMPID
