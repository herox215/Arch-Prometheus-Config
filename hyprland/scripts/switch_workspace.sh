#!/sbin/bash

# Script zum Wechseln von Hyprland Workspaces mit automatischem Wallpaper-Wechsel
# Verwendung: switch_workspace.sh <workspace_nummer>

# Ermittle das Verzeichnis des Scripts
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

workspace=$1

# Prüfe ob Parameter übergeben wurde
if [ -z "$workspace" ]; then
    echo "Fehler: Keine Workspace-Nummer angegeben"
    echo "Verwendung: $0 <workspace_nummer>"
    exit 1
fi

# Wechsle zum Workspace
hyprctl dispatch workspace $workspace

# Setze entsprechendes Wallpaper mit dem separaten Script
"$SCRIPT_DIR/set_wallpaper.sh" $workspace 