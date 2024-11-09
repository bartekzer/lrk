#!/usr/bin/env bash

archive() {
    mkdir -p "$path/archive"

    mv "$path/$1" "$path/archive"
}