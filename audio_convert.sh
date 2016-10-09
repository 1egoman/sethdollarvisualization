#!/bin/bash
# vim: set syntax=sh :

# syntax: ./audio_convert input.txt total.wav
# input.txt:
# some_phrase
# 01 02
# 06 08

NAME="$(cat $1 | head -n 1)"
CONTENTS="$(cat $1 | tail -n +2)"

IFS=$'\n'       # make newlines the only separator
VAR=0
for i in $CONTENTS; do
  CMD="sox $2 "$NAME-$VAR.wav" trim $i"
  echo "Running $CMD"
  $CMD
  VAR=$((VAR+1))
done

