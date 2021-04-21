#!/bin/bash


/usr/lib/xfce-polkit/xfce-polkit &
synclient "TapButton1=1"
synclient "TapButton2=3"
synclient "TapButton3=2"
picom -b
unclutter -b
nitrogen --restore

# Terminate already running bar instances
#killall -q polybar

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
#polybar example &

#echo "Polybar launched..."
