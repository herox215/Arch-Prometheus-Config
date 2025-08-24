#!/bin/bash

# ASCII-Animationsframes für Archangel
FRAMES=(
    "⚡ ARCHANGEL"
    "⚡ ARCHANGEL ."
    "⚡ ARCHANGEL .."
    "⚡ ARCHANGEL ..."
    "⚡ ARCHANGEL"
    "⚡ ARCHANGEL ."
    "⚡ ARCHANGEL .."
    "⚡ ARCHANGEL ..."
)

# Prüfe ob Akku gerade aufgeladen wird
is_loading() {
    # Suche nach Akku-Informationen in /sys/class/power_supply/
    for battery in /sys/class/power_supply/BAT*; do
        if [[ -d "$battery" ]]; then
            local status=$(cat "$battery/status" 2>/dev/null)
            if [[ "$status" == "Charging" ]]; then
                return 0  # Akku wird geladen
            fi
        fi
    done
    
    return 1  # Akku wird nicht geladen
}

# Animation oder statischer Text
if is_loading; then
    # Zykle durch Animation basierend auf aktueller Sekunde
    frame_index=$(( $(date +%s) % ${#FRAMES[@]} ))
    echo "${FRAMES[$frame_index]} (loading)"
else
    echo "ARCHANGEL"
fi 