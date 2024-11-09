#!/usr/bin/env bash

show_help() {
    cat <<EOF
Usage: ${0##*/} <command> [options]
Commands:
    add [--title TITLE] [--tags TAGS]   Add a new note with optional tags
    list [--tags TAGS] [--all]          List notes with optional filters
         [--sort date|title|tag]
    find [--title TITLE] [--tags TAGS]  Find notes by title, tags, or date
         [--date DATE]
    delete ID                           Delete a note by ID
    archive ID                          Archive a note by ID
    unarchive ID                        Unarchive a note by ID
    backlinks ID                        Show backlinks for a note by ID
    help                                Show this help message
EOF
}