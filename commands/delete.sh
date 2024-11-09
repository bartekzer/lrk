#!/usr/bin/env bash

delete() {
    if [ -a "$path/$1" ]; then
        rm "$path/$1"
    else
        echo "Note not found"
        return 1
    fi
}