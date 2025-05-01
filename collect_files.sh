#!/bin/bash

from="$1"
to="$2"
flag=false

if [ "$1" = "--max_depth" ]; then
    from="$3"
    to="$4"
    depth="$2"
    flag=true
fi

if [ "$flag" = false ]; then
    find "$from" -type f | while read file; do
        # https://www.geeksforgeeks.org/basename-command-in-linux-with-examples/
        curName=$(basename "$file")
        # https://stackoverflow.com/questions/15529779/unix-mv-backup-numbered
        cp --backup=numbered "$file" "$to/$curName"
    done
else
    # https://www.geeksforgeeks.org/mindepth-maxdepth-linux-find-command-limiting-search-specific-directory/
    find "$from" -maxdepth "$depth" -type f | while read file; do
        # https://www.geeksforgeeks.org/basename-command-in-linux-with-examples/
        curName=$(basename "$file")
        # https://stackoverflow.com/questions/15529779/unix-mv-backup-numbered
        cp --backup=numbered "$file" "$to/$curName"
    done
fi
