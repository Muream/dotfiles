killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
MONITOR=DP-1 polybar statusbar &
MONITOR=DVI-I-1 polybar statusbar &
