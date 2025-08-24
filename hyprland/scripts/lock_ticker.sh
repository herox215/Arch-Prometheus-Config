#!/sbin/bash

# ASCII Ticker Animation für hyprlock
# Zeigt einen scrollenden Text von rechts nach links

# Konfiguration
MESSAGE="    * SYSTEM LOCKED - ACCESS DENIED - ENTER PASSWORD TO CONTINUE *    "
WIDTH=35  # Sichtbare Zeichen
SPEED=1   # Scroll-Geschwindigkeit (Zeichen pro Update)

# Berechne aktuelle Position basierend auf Zeit (mit Nanosekunden für flüssigere Animation)
NANOSEC=$(date +%N | head -c 3)  # Erste 3 Ziffern der Nanosekunden (ohne Nullen zu entfernen)
TIMESTAMP=$(date +%s)
TOTAL_LENGTH=${#MESSAGE}

# Verwende eine schnellere Animation basierend auf Nanosekunden
POS=$(( (TIMESTAMP * 10 + 10#$NANOSEC / 100) % TOTAL_LENGTH ))

# Erstelle den sichtbaren Text-Ausschnitt
VISIBLE_TEXT=""
for (( i=0; i<WIDTH; i++ )); do
    CHAR_INDEX=$(( (POS + i) % TOTAL_LENGTH ))
    VISIBLE_TEXT+="${MESSAGE:$CHAR_INDEX:1}"
done

# Emoji-stabiler Output mit fester Formatierung
printf "%-${WIDTH}s\n" "$VISIBLE_TEXT" 