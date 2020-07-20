export LANG=en_US.UTF-8
export ENV=$HOME/.kshrc
xrdb -merge $HOME/.Xresources
xidle &
xset b off
setxkbmap -option ctrl:nocaps
compton -b --config ~/.config/compton.conf &

while true; do
        xsetroot -name " $(date +"%I:%M")"
        sleep 30
done &

exec dwm
