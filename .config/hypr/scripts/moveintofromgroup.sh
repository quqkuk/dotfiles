#!/usr/bin/bash
set -o errexit
GROUP=$(hyprctl activewindow | grep grouped | tr -s ' ' | cut -d' ' -f2)
if [ $GROUP = "0" ]; then
	# Window is in no group, move it into the group in $1 direction
	hyprctl dispatch moveintogroup "$1"
else
	# Window is in a group, move it out of the group
	hyprctl dispatch moveoutofgroup "$1"
fi
