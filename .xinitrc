xmodmap .xmodmaprc
xbindkeys
xrdb .Xresources

roxterm &
redshift &
(conky | while read line; do xsetroot -name "$line"; done) &
xrandr --output VGA1 --left-of LVDS1
exec dwm
#exec start-lumina-desktop
