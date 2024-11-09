#!/usr/bin/env bash

add() {
    fname="$(date +'%Y%m%d%H%M%S')"

    local tags=""
    local title=""

    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            --tags)
                tags="$2"
                shift 2
                ;;
            --title)
                title="$2"
                shift 2
                ;;
            *)
                echo "Unknown option: $1"
                return 1
                ;;
        esac
    done

    cat >"$path/$fname" <<EOF
TITLE: ${title}
DATE: $(date +"%Y-%m-%d %H:%M:%S")
TAGS: ${tags}
---
EOF
    echo "Note created at $path/$fname"
}
