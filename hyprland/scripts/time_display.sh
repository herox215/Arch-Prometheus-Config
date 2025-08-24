#!/sbin/bash

# Zeit-Anzeige für hyprlock
# Zeigt die aktuelle Zeit in einem schönen Format

# Zeitformate
WEEKDAY=$(date +%A)
DATE=$(date +"%d.%m.%Y")
TIME=$(date +"%H:%M:%S")

# Formatierte Ausgabe
printf "%s, %s - %s\n" "$WEEKDAY" "$DATE" "$TIME" 