#!/bin/bash
from="$1"
to="$2"
find "$from" -type f | while read file; do
    # https://www.geeksforgeeks.org/basename-command-in-linux-with-examples/
    curName=$(basename "$file")
    # https://stackoverflow.com/questions/15529779/unix-mv-backup-numbered
    cp --backup=numbered "$file" "$to/$curName"
done
