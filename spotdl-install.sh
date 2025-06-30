#!/data/data/com.termux/files/usr/bin/bash

# Update and install required tools
pkg update -y && pkg install wget ffmpeg -y

# Install SpotDL using official script
curl -sL https://raw.githubusercontent.com/spotDL/spotify-downloader/master/scripts/termux.sh | bash

# Create music folder
mkdir -p /storage/emulated/0/Music/SpotDL

# Alias to go to the download folder
echo 'alias gotospot="cd /storage/emulated/0/Music/SpotDL"' >> ~/.bashrc

# Alias for shorter spotdl command
echo 'alias spot="spotdl"' >> ~/.bashrc

# Reload aliases immediately
source ~/.bashrc

# Reload shell so aliases work
source ~/.bashrc

# Go to the folder
gotospot
