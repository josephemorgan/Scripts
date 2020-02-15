#!/bin/zsh

pkill picom
sleep .1
picom -f -b --invert-color-include 'class_g="qutebrowser"'
