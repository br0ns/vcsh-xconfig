#!/bin/bash

# Set up environment
[ -f ~/.profile ] && . ~/.profile
export XAUTHORITY=~/.Xauthority

# Load custom XRandR settings
[ -f ~/.xrandr ] && . ~/.xrandr

# Turn bell off
xset b off

# Desktop background
feh --bg-fill ~/.wallpaper

# Make the clipboard a little bit more sane
autocutsel -fork
autocutsel -fork -selection PRIMARY

# Compositing manager (I like inactive windows to be just slightly transparent)
(xcompmgr &)

# SSH agent should have been started by X; see /etc/X11/Xsession.options
# Wait until XMonad has started, then spawn a terminal to add the key
# XXX: Switch to `gpg-agent --enable-ssh-support`?
(sleep 0.5 ; xterm -e ssh-add) &

# Configure keyboard
./.xsession-keyboard

# Start the WM
exec -a xmonad ~/.cabal/bin/xmonad
