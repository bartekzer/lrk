#!/usr/bin/env bash

create() {
    fname="$(date +'%Y%m%d%H%M%S')"

    cat >"$path/$fname" <<EOF
TITLE:
DATE: $(date +"%Y-%m-%d %H:%M:%S")
TAGS:
---
EOF
    echo "Note created at $path/$fname"
}
