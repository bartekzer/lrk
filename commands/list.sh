#!/usr/bin/env bash

list() {
    local tags=""
    local all=false
    local sort_by=""

    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            --tags)
                tags="$2"
                shift 2
                ;;
            --all)
                all=true
                shift
                ;;
            --sort)
                sort_by="$2"
                shift 2
                ;;
            *)
                echo "Unknown option: $1"
                return 1
                ;;
        esac
    done

    echo "Listing notes in $path:"

    if [ "$all" = true ]; then
        notes=$(find "$path" -type f)
    else
        notes=$(find "$path" -type f -not -path "*/archive/*")
    fi

    if [ -n "$tags" ]; then
        IFS=',' read -r -a tag_array <<< "$tags"
        for tag in "${tag_array[@]}"; do
            notes=$(echo "$notes" | xargs grep -l "TAGS:.*$tag")
        done
    fi

    case "$sort_by" in
        date)
            notes=$(echo "$notes" | xargs ls -lt)
            ;;
        title)
            notes=$(echo "$notes" | xargs ls -1 | sort)
            ;;
        tag)
            notes=$(echo "$notes" | xargs grep -H "TAGS:" | sort -t: -k2,2)
            ;;
        *)
            notes=$(echo "$notes" | xargs ls -1)
            ;;
    esac

    echo "$notes"
}