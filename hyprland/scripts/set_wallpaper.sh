#!/sbin/bash

# Script zum Setzen von Wallpapern basierend auf Workspace-Nummer
# Verwendung: set_wallpaper.sh <workspace_nummer>

workspace=$1

# Prüfe ob Parameter übergeben wurde
if [ -z "$workspace" ]; then
    echo "Fehler: Keine Workspace-Nummer angegeben"
    echo "Verwendung: $0 <workspace_nummer>"
    exit 1
fi

# Setze entsprechendes Wallpaper
case $workspace in
    1)
        swww img ~/.config-prometheus/hyprland/wallpaper/wp_1.png --transition-step 30 --transition-fps 60
        ;;
    2)
        swww img ~/.config-prometheus/hyprland/wallpaper/wp_2.png --transition-step 30 --transition-fps 60
        ;;
    3)
        swww img ~/.config-prometheus/hyprland/wallpaper/wp_3.png --transition-step 30 --transition-fps 60
        ;;
    4)
        swww img ~/.config-prometheus/hyprland/wallpaper/wllppr4.gif --transition-step 30 --transition-fps 60
        ;;
    10)
        swww img ~/.config-prometheus/hyprland/wallpaper/wp_tech.png --transition-step 30 --transition-fps 60
        ;;
    *)
        echo "Kein Wallpaper für Workspace $workspace definiert"
        ;;
esac 