#!/bin/bash


scriptRelativePath=`dirname $0`
echo $scriptRelativePath

files=`find . -maxdepth 1 -name "*.jpg" -o -name "*.png" -o -name "*.bmp" -o -name "*.gif"`

#for each picture in repository
for file in $files; do #TODO: add .png and other files extensions
  file $file
done


#############################################################
#read from file and parse to get picture sizes
unparsedsizes=$("$scriptRelativePath"/fileReader.sh "$scriptRelativePath"/sizes.txt)
chmod +x ""$scriptRelativePath"/pictureSizeParser.py"
parsedSizes=$(python "$scriptRelativePath"/pictureSizeParser.py $unparsedsizes)
echo $parsedSizes

#build sizes array
IFS=',' read -ra sizes <<< "$parsedSizes"
for i in "${sizes[@]}"; do
    echo $i
done
#TODO:
#separate pictures



echo "done"

