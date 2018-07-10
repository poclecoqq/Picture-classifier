#!/bin/bash


scriptRelativePath=`dirname $0`

oldDirectories=`find . -maxdepth 1 -type d -name "PS_*"`
for dir in $oldDirectories; do
  rm -rf $dir
done


files=`find . -maxdepth 1 -type f -name "*.jpg" -o -name "*.png" -o -name "*.bmp" -o -name "*.gif"`

#for each picture in repository
for file in $files; do
  size=$(python "$scriptRelativePath"/pictureSizeParser.py `file $file`)
  mkdir -p "PS_"$size""
  cp -n $file "PS_"$size""
done

echo "done"

