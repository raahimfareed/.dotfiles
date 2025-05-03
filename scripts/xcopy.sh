#! /usr/bin/env sh

if [ -z "$1" ]
then
    printf "Please enter a valid filename!"
    exit 1
fi

cat $1 | xclip -selection clipboard

