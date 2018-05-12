xmodmap .xmodmaprc
xbindkeys

urxvt &
redshift &
(conky | while read line; do xsetroot -name "$line"; done) &
exec dwm
#exec start-lumina-desktop
