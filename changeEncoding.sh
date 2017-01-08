#!/bin/bash
for file in * ; do
    if iconv -f WINDOWS-1252 -t UTF-8 "$file" >> "${file%.txt}.new"; then
        echo "Successful. Deleting original ${file%.txt} and renaming new version to ${file%.txt}"
        rm "$file"
        mv "${file%.txt}.new" "$file"
    else
        echo "Failed. deleting ${file%.txt}.new"
        rm "${file%.txt}.new"
    fi
done