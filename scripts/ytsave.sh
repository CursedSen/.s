#!/bin/bash
# Use the following commands:
# sudo cp -r ~/.config/scripts/ytsave.sh /usr/local/bin/
# chmod +x /usr/local/bin/ytsave.sh
# Then execute "ytsave.sh" in terminal

read -p "Enter YouTube video URL: " video_url

if [[ -z "$video_url" ]]; then
    echo "Error: No URL provided. Exiting."
    exit 1
fi

read -p "Enter save location (default: $HOME/Videos): " save_location

if [[ -z "$save_location" ]]; then
    save_location="$HOME/Videos"
fi

mkdir -p "$save_location"

yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" \
       --merge-output-format mp4 \
       --write-thumbnail \
       --embed-thumbnail \
       --output "$save_location/%(title)s.%(ext)s" \
       "$video_url"

echo "Download complete! Saved to: $save_location"
