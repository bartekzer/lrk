#!/usr/bin/env bash

unarchive() {
    if [ -d "$path/archive" ]; then
        if [ -a "$path/archive/$1" ]; then
            mv "$path/archive/$1" "$path"
        else
            echo "Note not found in archive"
            return 1
        fi
    else
        echo "No archive directory found"
        return 1
    fi
}