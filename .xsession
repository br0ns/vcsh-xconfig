#!/bin/bash

# Set up environment
[ -f ~/.profile ] && . ~/.profile

# Load custom settings (I use this on both my laptop and desktop and
# they need slightly different settings)
[ -f ~/.custom ] && . ~/.custom

# Turn bell off
xset b off

# Start the WM
.cabal/bin/xmonad &
WMPID=$!

# Desktop background
feh --bg-scale ~/.wallpaper.jpg

# Make the clipboard a little bit more sane
autocutsel -fork
autocutsel -fork -selection PRIMARY

# Compositing manager (I like inactive windows to be just slightly transparent)
(xcompmgr &)

# Keyboard stuff
setxkbmap us -variant altgr-intl -option compose:prsc,compose:menu,nodeadkeys
xmodmap ~/.xmodmap

wait $WMPID
