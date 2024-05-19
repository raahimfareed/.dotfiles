#! /usr/bin/env sh

if [ ! -z $1 ]; then
    git clone "https://github.com/$1.git"
else
    printf "Usage: clone username/repo\nUses git command to clone the repo in current directory"
fi

