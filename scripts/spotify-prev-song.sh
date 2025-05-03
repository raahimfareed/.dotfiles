#!/usr/bin/env sh 
if pgrep -x "spotify" > /dev/null
then
  dbus-send \
  --print-reply \
  --session \
  --dest=org.mpris.MediaPlayer2.spotify \
  /org/mpris/MediaPlayer2 \
  org.mpris.MediaPlayer2.Player.Previous
fi

