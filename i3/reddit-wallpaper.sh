while true
do 
    WALLPAPER=$(/home/muream/.virtualenvs/reddit-wallpaper/bin/python ~/github/reddit-wallpaper/reddit-wallpaper.py 2>&1)
    feh --bg-scale $WALLPAPER
    sleep 60
done
