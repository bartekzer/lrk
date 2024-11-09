#!/usr/bin/env bash

backlinks() {
    grep -l -r "[[$1]]" "$path" | xargs -n 1 basename
}