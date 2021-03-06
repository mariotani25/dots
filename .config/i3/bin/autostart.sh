#!/usr/bin/env bash

## Copyright (C) 2020-2021 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3
## Autostart Programs

# Kill already running process
#_ps=(picom dunst ksuperkey mpd xfce-polkit xfce4-power-manager)
_ps=(easyeffects pasystray polybar picom dunst ksuperkey mpd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Enable power management
xfce4-power-manager &

# Clipboard
parcellite &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Restore wallpaper
# hsetroot -cover ~/.config/wallpapers/Sprinkle.svg
nitrogen --restore &

# Lauch notification daemon
~/.config/i3/bin/i3dunst.sh

# Lauch polybar
# ~/.config/i3/bin/i3bar.sh
~/.config/polybar/launch.sh

# Lauch compositor
~/.config/i3/bin/i3comp.sh

#lxsession &

# Audio
easyeffects --gapplication-service &
pasystray &

# Blueberry
# blueberry-tray &

# Start mpd
# exec mpd &

autotiling &