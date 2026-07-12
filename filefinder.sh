#!/bin/bash
# let it be known, that i just started learning bash, any fails idk
search() {
    local res
    res=$(find . -type "$1" -name "$2" -print -quit)

    if [ -n "$res" ]; then
        echo "found: $res"
        stat "$res"
    else
        echo "not found"
    fi
}
echo " -------------------- FILE FINDER --------------------"
echo "1) search for a file"
echo "2) search for a directory"
echo "3) getout"
read -rp "> " answer

case "$answer" in
    1) read -rp "file name: " filenam
        search "f" "$filenam" 
        ;;
    2) read -rp "directory name: " dirname
        search "d" "$dirname"
        ;;
    3) echo "exiting..."
        exit 0
        ;;
    *) echo "invalid input"
        ;;
esac
