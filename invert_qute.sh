#!/bin/zsh

pkill picom
sleep .1
picom -f -b --experimental-backends --invert-color-include 'class_g="qutebrowser"'
