#!/bin/bash

# Configurazione (usa variabili d'ambiente)
RTSP_URL="${RTSP_URL:-rtsp://admin:123456@192.168.1.100/live/profile.0}"
INTERVALLO="${INTERVALLO:-30}" # secondi
CARTELLA="${CARTELLA:-screenshots}"

# Crea la cartella se non esiste
mkdir -p "$CARTELLA"

# Loop infinito per catturare screenshot ogni INTERVALLO secondi
while true; do
    # Formatta la data e ora corrente
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

    # Definisci il nome del file
    FILENAME="$CARTELLA/screenshot_$TIMESTAMP.jpg"

    # Cattura lo screenshot
    timeout 10 ffmpeg -rtsp_transport tcp -y -i "$RTSP_URL" -frames:v 1 "$FILENAME"

    echo "Screenshot salvato: $FILENAME"

    # Aspetta INTERVALLO secondi prima del prossimo screenshot
    sleep $INTERVALLO
done
