#!/usr/bin/bash
#bind = , 1, exec, loginctl poweroff
#bind = , 1, submap, reset
#bind = , 2, exec, loginctl reboot
#bind = , 2, submap, reset
#bind = , 3, exec, loginctl suspend
#bind = , 3, submap, reset
#bind = , Q, exit
#bind = , R, exec, hyprctl reload
#bind = , R, submap, reset
#bind = , Escape, submap, reset
set -o errexit
CHOSEN_COMMAND=$(tofi <<EOF
Power Off
Reboot
Suspend
Exit Hyprland
Reload Hyprland Config
EOF
)
LOGINCTL="/usr/bin/loginctl"
HYPRCTL="/usr/bin/hyprctl"
case "$CHOSEN_COMMAND" in
	"Power Off") ${LOGINCTL} poweroff;;
	"Reboot") ${LOGINCTL} reboot;;
	"Suspend") /usr/bin/swaylock -f && ${LOGINCTL} suspend;;
	"Exit Hyprland") ${HYPRCTL} dispatch exit;;
	"Reload Hyprland Config") ${HYPRCTL} reload;;
esac
