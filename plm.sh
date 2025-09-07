#!/usr/bin/env bash
# plm.sh - PLM command script

PLM_VERSION="PLM ver 1.0"

# Existing commands
COMMANDS=("plugin-connect")

# Find directory of this script (works in Bash & Zsh)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"

if [ $# -eq 0 ]; then
    echo "$PLM_VERSION"
    echo "Available commands:"
    for cmd in "${COMMANDS[@]}"; do
        echo " - $cmd"
    done
    exit 0
fi

case "$1" in
    plugin-connect)
        if [ -f "$SCRIPT_DIR/plugin-connect.sh" ]; then
            "$SCRIPT_DIR/plugin-connect.sh" "${@:2}"
        else
            echo "Error: plugin-connect.sh not found in $SCRIPT_DIR"
        fi
        ;;
    *)
        echo "Unknown command: $1"
        echo "Use 'plm' with no arguments to see available commands."
        ;;
esac
