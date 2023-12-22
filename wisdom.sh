#!/bin/bash
shopt -s globstar nullglob dotglob
cd /home/wolverine
while true
  do
    for line in */*.mp3
      do
        playCMD=$(ffplay -autoexit -i "$line")
        bash -c "$playCMD"
    done
done
