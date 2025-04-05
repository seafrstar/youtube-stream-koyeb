#!/bin/bash

FILE_ID="1E3QOEFEu0-kih0j63AgxaqS_1dmWW-No"
FILE_NAME="1.mp4"
STREAM_KEY="eyq0-fyks-tdg7-htd1-butt"

# Download video dari Google Drive
wget --no-check-certificate "https://drive.google.com/uc?export=download&id=${FILE_ID}" -O "$FILE_NAME"

# Loop video dan stream ke YouTube
ffmpeg -re -stream_loop -1 -i "$FILE_NAME" \
    -f lavfi -i anullsrc \
    -c:v libx264 -preset veryfast -maxrate 3000k -bufsize 6000k \
    -c:a aac -b:a 160k -ar 44100 \
    -f flv "rtmp://a.rtmp.youtube.com/live2/$eyq0-fyks-tdg7-htd1-butt"
