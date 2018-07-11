#!/usr/bin/env bash


scriptRelativePath=`dirname $0`
clean=false
move=false

source "$scriptRelativePath"/argParser.sh

if $clean; then
  oldDirectories=`find . -maxdepth 1 -type d -name "PS_*"`
  for dir in $oldDirectories; do
    rm -rf $dir
  done
else
  if $move; then
    pictureTranferCommand="mv"
  else
    pictureTranferCommand="cp -n" 
  fi

  files=`find . -maxdepth 1 -type f -name "*.jpg" -o -name "*.png" -o -name "*.bmp" -o -name "*.gif"`

  #for each picture in repository
  for file in $files; do
    size=$(python "$scriptRelativePath"/pictureSizeParser.py `file $file`)
    mkdir -p "PS_"$size""
    eval $pictureTranferCommand $file "PS_"$size""
  done
fi

echo "done"

