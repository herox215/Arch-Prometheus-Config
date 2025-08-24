#!/bin/bash

# Funktion zum Prüfen, ob Glava läuft
is_glava_running() {
    pgrep -f "glava -d" > /dev/null
}

# Funktion zum Umschalten des Visualizers
toggle_visualizer() {
    if is_glava_running; then
        pkill -f "glava -d"
        notify-send "Visualiser" "Ausgeschaltet" -t 1000
    else
        cd ~/.config/glava
        glava -d &
        sleep 0.5
        notify-send "Visualiser" "Eingeschaltet" -t 1000
    fi
}

# Visualiser umschalten
toggle_visualizer 