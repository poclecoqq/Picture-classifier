#!/bin/bash
# took from stack overflow: https://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Text read from file: $line"
done < "$1"
