#!/data/data/com.termux/files/usr/bin/bash

# Update and install required tools
pkg update -y && pkg install wget ffmpeg -y
# Create music folder
mkdir -p /storage/emulated/0/Music/SpotDL

source ~/.bashrc

# Alias to go to the download folder
echo 'alias gotospot="cd /storage/emulated/0/Music/SpotDL"' >> ~/.bashrc
source ~/.bashrc

# Install SpotDL using official script
curl -sL https://raw.githubusercontent.com/spotDL/spotify-downloader/master/scripts/termux.sh | bash







