#!/usr/bin/env bash

find_notes() {
    local title=""
    local tags=""
    local date=""
    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            --title)
                title="$2"
                shift 2
                ;;
            --tags)
                tags="$2"
                shift 2
                ;;
            --date)
                date="$2"
                shift 2
                ;;
            *)
                echo "Unknown option: $1"
                return 1
                ;;
        esac
    done

    echo "Finding notes in $path:"
    notes=$(command find "$path" -type f -not -path "*/archive/*")

    if [ -n "$title" ]; then
        notes=$(echo "$notes" | xargs grep -l "TITLE:.*$title")
    fi

    if [ -n "$tags" ]; then
        IFS=',' read -r -a tag_array <<< "$tags"
        for tag in "${tag_array[@]}"; do
            notes=$(echo "$notes" | xargs grep -l "TAGS:.*$tag")
        done
    fi

    if [ -n "$date" ]; then
        notes=$(echo "$notes" | xargs grep -l "DATE:.*$date")
    fi

    echo "$notes"
}