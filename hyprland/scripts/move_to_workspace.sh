#!/sbin/bash

# Script zum Verschieben von Fenstern zu Hyprland Workspaces mit automatischem Wallpaper-Wechsel
# Verwendung: move_to_workspace.sh <workspace_nummer>

# Ermittle das Verzeichnis des Scripts
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

workspace=$1

# Prüfe ob Parameter übergeben wurde
if [ -z "$workspace" ]; then
    echo "Fehler: Keine Workspace-Nummer angegeben"
    echo "Verwendung: $0 <workspace_nummer>"
    exit 1
fi

# Verschiebe aktives Fenster zum Workspace
hyprctl dispatch movetoworkspace $workspace

# Setze entsprechendes Wallpaper mit dem separaten Script
"$SCRIPT_DIR/set_wallpaper.sh" $workspace 