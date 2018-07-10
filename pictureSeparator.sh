#!/bin/bash


scriptRelativePath=`dirname $0`
echo $scriptRelativePath

files=`find . -maxdepth 1 -name "*.jpg" -o -name "*.png" -o -name "*.bmp" -o -name "*.gif"`

#for each picture in repository
for file in $files; do #TODO: add .png and other files extensions
  size=$(python "$scriptRelativePath"/pictureSizeParser.py `file $file`)
  echo $size
done

#TODO:
#separate pictures



echo "done"

