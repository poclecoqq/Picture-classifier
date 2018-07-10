#!/bin/bash


scriptRelativePath=`dirname $0`


files=`find . -maxdepth 1 -name "*.jpg" -o -name "*.png" -o -name "*.bmp" -o -name "*.gif"`

#for each picture in repository
for file in $files; do
  size=$(python "$scriptRelativePath"/pictureSizeParser.py `file $file`)
  mkdir -p "PS_"$size""
  cp $file "PS_"$size""
done

echo "done"

