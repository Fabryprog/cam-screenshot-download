FROM alpine:latest

# Installa FFmpeg
RUN apk update && apk add --no-cache ffmpeg bash

# Imposta directory di lavoro
WORKDIR /app

# Copia lo script nel container
COPY capture_screenshots.sh /app/capture_screenshots.sh

# Rendi eseguibile lo script
RUN chmod +x /app/capture_screenshots.sh

# Directory per gli screenshot
VOLUME ["/app/screenshots"]

# Variabili d'ambiente di default (personalizzabili)
ENV RTSP_URL="rtsp://admin:123456@192.168.1.100/live/profile.0"
ENV INTERVALLO=30
ENV CARTELLA="screenshots"

# Comando di avvio
CMD ["/app/capture_screenshots.sh"]

