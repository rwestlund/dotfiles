xmodmap .xmodmaprc
xbindkeys

st &
redshift &
(conky | while read line; do xsetroot -name "$line"; done) &
exec dwm
#exec start-lumina-desktop
