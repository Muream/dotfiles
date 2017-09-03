#!/bin/bash
while true
do 
    WALLPAPER=$(/home/muream/.virtualenvs/reddit-wallpaper/bin/python ~/github/reddit-wallpaper/reddit-wallpaper.py >&1)
    echo $WALLPAPER
    feh --bg-scale $WALLPAPER
    sleep 10
done
