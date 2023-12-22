#!/bin/bash
shopt -s globstar nullglob dotglob
cd /home/wolverine
find . -wholename "*/*.mp3" | while read line; do
  TITLE=$(ffprobe -loglevel error -show_entries format_tags=title -of default=nw=1:nk=1 "$line")
  ARTIST=$(ffprobe -loglevel error -show_entries format_tags=artist -of default=nw=1:nk=1 "$line")
  DURATION=$(ffprobe -loglevel error -show_entries format=duration -of default=nw=1:nk=1 "$line")
  playCMD=$(ffplay -autoexit -i -loop 0 "$line")
  if bash -c "$playCMD"; then
  echo "PLAYING NOW\!\!\! Track: $TITLE Title: $ARTIST Duration: $DURATION"
  else
  echo "nothing to play"
  fi
done
