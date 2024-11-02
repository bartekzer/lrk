#!/usr/bin/env bash

set -euo pipefail

path="$HOME/.lrk"
if [ ! -z "${LRK_DIR+x}" ]; then
    path="$LRK_DIR"
fi

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

for subcommand in add archive backlinks delete find help list open unarchive
do
    source "$SCRIPT_DIR/commands/$subcommand.sh"
done

main() {
    case "$1" in
        add)
            shift
            add "$@"
            ;;
        archive)
            shift
            archive "$@"
            ;;
        backlinks)
            shift
            backlinks "$@"
            ;;
        delete)
            shift
            delete "$@"
            ;;
        find)
            shift
            find "$@"
            ;;
        help|--help|-h)
            show_help
            ;;
        list)
            shift
            list "$@"
            ;;
        open)
            shift
            open "$@"
            ;;
        unarchive)
            shift
            unarchive "$@"
            ;;
        *)
            echo "Error: Unknown command '$1'"
            show_help
            exit 1
            ;;
    esac
}

if [ "$#" -eq 0 ]; then
    show_help
    exit 1
else
    main "$@"
fi