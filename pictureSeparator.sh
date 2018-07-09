#!/bin/bash

#Ask user if he is in the directory to operate program
while true; do
  read -p "Are you in the directory with pictures to separate (y/n)?: " useCurrentDirectory
  if [ $useCurrentDirectory == "y" ] || [ $useCurrentDirectory == "n" ]; then
    break
  fi
  echo "invalid input"
done

#Build directory path
if [ $useCurrentDirectory == "n" ]; then
  while true; do
    read -p "Enter the path to the directory to operate program: " directoryLocation
    #if prompted directory location is valid, continue
    if [ -d $directoryLocation ]; then 
      break
    fi
    echo "invalid path"
  done
else
  directoryLocation="$(PWD)"
fi


#criteria to separate pictures
while true; do 
  read -p "`echo -e 'Separate pictures depending on which criteria? \n
  e -> EXIF (picture metadata - vertical or horizontal) \n
  s -> size \n
  '`" criteria
  if [ $criteria == "e" ] || [ $criteria == "s" ]; then
    break
  fi
  echo "invalid input"
done

case "$criteria" in
  e)
    #TODO
  ;;

  #if criteria = size
  s)
    unparsedsizes=$(./fileReader.sh ./sizes.txt)
    chmod +x ./pictureSizeParser.py
    parseSizes=$(python ./pictureSizeParser.py $unparsedsizes)
    echo $parseSizes
    ;;
esac


#TODO: regex $sizes n put in array
#separate pictures



echo "done"

