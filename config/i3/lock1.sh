#!/bin/bash -e

# define covers
AVATAR=$HOME/.local/bin/lock/avatar.png
FANCY=$HOME/.local/bin/lock/photo.png
TEXT=$HOME/.local/bin/lock/index.png

# Add weather
curl --silent wttr.in/Hangzhou_0qp_transparency=255_lang=zh.png -o /tmp/weather.png
WEATHER=/tmp/weather.png

# define lock background
PICTURE=/tmp/lock.png
scrot $PICTURE

# add blur
BLUR="5x4"
convert $PICTURE -blur $BLUR $PICTURE
# add avatar
composite -geometry +875+455 $AVATAR $PICTURE $PICTURE
# add hint text
composite -geometry +325+840 $TEXT $PICTURE $PICTURE
# add live2d image
composite -gravity southwest $FANCY $PICTURE $PICTURE
# add weather image
convert $WEATHER -transparent black $WEATHER
composite -geometry +1600+120 $WEATHER $PICTURE $PICTURE

# define ring color
blank='#00000000'  # blank
background='#1A5E81AC'
foreground='#D8DEE9FF'  # time text
primary='#82b1ff'  # default
alert='#EBCB8BFF'  # wrong
verifying='#A3BE8CFF'  # verifying

i3lock \
--screen 1 \
--indicator \
\
--insidevercolor=$blank    \
--insidewrongcolor=$blank  \
--insidecolor=$blank       \
\
--ringvercolor=$primary         \
--ringwrongcolor=$alert         \
--ringcolor=$primary            \
\
--linecolor=$primary            \
--line-uses-inside \
\
--keyhlcolor=$alert             \
--bshlcolor=$alert              \
\
--separatorcolor=$primary       \
\
--verifcolor=$foreground        \
--wrongcolor=$foreground        \
--timecolor=$foreground \
--datecolor=$foreground         \
--layoutcolor=$foreground       \
\
--veriftext=""          \
--wrongtext=""          \
--clock \
--timepos="1700:80" \
--timestr="%H:%M:%S %p"  \
--timesize=50 \
--datepos="1700:120" \
--datestr="%Y-%m-%d %A" \
--datesize=20 \
-i $PICTURE
#--clock               \
#--timestr="%H:%M:%S"  \
#--datestr="%A, %m %Y" \
#--modsize=10 \
#--time-font=noto-sans    \
#--date-font=noto-sans    \


# run a conky clock
#i3lockpid=$!
#winid=`xwininfo -name "i3lock" | grep "Window id" | grep -oE "0x[0-9a-f]+"`
#conky -w $winid
#conkypid=$!

# the rest
#wait $i3lockpid
#kill $conkypid
rm $PICTURE $WEATHER

