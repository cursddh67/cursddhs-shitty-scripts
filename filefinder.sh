#!/bin/bash
# finished i guess

search() {
    local res
    local dir="${3:-.}"

    if [ ! -d "$dir" ]; then
        echo "directory not found"
        return
    fi

    res=$(find "$dir" -type "$1" -name "$2" -print -quit)

    if [ -n "$res" ]; then
        echo "found: $res"
        stat "$res"
    else
        echo "not found"
    fi
}

while true; do
    clear
    echo " -------------------- file finder --------------------"
    echo "1) search for a file"
    echo "2) search for a directory"
    echo "3) getout"

    read -rp "> " answer

    case "$answer" in
        1)
            read -rp "file name: " filename
            read -rp "search in (default current directory): " path
            search "f" "$filename" "${path:-.}"
            ;;
        2)
            read -rp "directory name: " dirname
            read -rp "search in (default current directory): " path
            search "d" "$dirname" "${path:-.}"
            ;;
        3)
            echo "exiting..."
            exit 0
            ;;
        *)
            echo "invalid input"
            ;;
    esac

    read -rp "press enter to continue... "
done
