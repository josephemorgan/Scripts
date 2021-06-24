#!/bin/zsh

speakers="alsa_output.pci-0000_09_00.3.analog-stereo"
headphones=$(pactl list short sinks | grep "AT2020USB" | cut -f2)

currently_running_sink=$(pactl list short sinks | grep -i -s "running" | cut -f2)

if [ "$currently_running_sink" = "$speakers" ]; then
	switch_to_id=$(pactl list short sinks | grep -i -s $headphones | cut -f1)
else
	switch_to_id=$(pactl list short sinks | grep -i -s $speakers | cut -f1)
fi

/usr/bin/pacmd set-default-sink $switch_to_id
