#!/data/data/com.termux/files/usr/bin/bash

# Update and install required tools
pkg update -y && pkg install wget ffmpeg -y
#note that thare are importent file ".Ayush_spot_script_cache" don't delete them if using spotdl 

# Install SpotDL using official script
curl -sL https://raw.githubusercontent.com/spotDL/spotify-downloader/master/scripts/termux.sh | bash







