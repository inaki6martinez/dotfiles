#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession

# set my custom keyboard <variant
setxkbmap -variant cat

# `dwmblocks-async` has its binary named `dwmblocks`
dwmblocks &
