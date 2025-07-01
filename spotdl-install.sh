#!/data/data/com.termux/files/usr/bin/bash

# Update and install required tools
pkg update -y && pkg install wget ffmpeg -y
# Create music folder
mkdir -p /storage/emulated/0/Music/SpotDL
mkdir -p /storage/emulated/0/.Ayush_spot_script_cache 
source ~/.bashrc

# this is making files 
echo 'alias gotospot="cd /storage/emulated/0/Music/SpotDL"' >> ~/.bashrc
source ~/.bashrc
cd /storage/emulated/0/.Ayush_spot_script_cache 
curl -sL https://raw.githubusercontent.com/cyberseekerx/scripts/refs/heads/main/spotdl-install.sh | bash 
echo 'alias spot="cd /storage/emulated/0/.Ayush_spot_script_cache && bash spot.sh"' >> ~/.bashrc
#note that thare are importent file ".Ayush_spot_script_cache" don't delete them if using spot 
# Install SpotDL using official script
curl -sL https://raw.githubusercontent.com/spotDL/spotify-downloader/master/scripts/termux.sh | bash







