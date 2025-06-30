#!/data/data/com.termux/files/usr/bin/bash

# Update and install required tools
pkg update -y && pkg install wget ffmpeg -y

# Install SpotDL using official script
curl -sL https://raw.githubusercontent.com/spotDL/spotify-downloader/master/scripts/termux.sh | bash

# Create download directory
mkdir -p /storage/emulated/0/Music/SpotDL

# Add alias to jump to download folder
echo 'alias gotospot="cd /storage/emulated/0/Music/SpotDL"' >> ~/.bashrc

# Add alias to download directly into download folder
cat > ~/.spotit <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd /storage/emulated/0/Music/SpotDL
spot "$1"
EOF

chmod +x ~/.spotit
echo 'alias spotit="~/.spotit"' >> ~/.bashrc

# Reload shell so aliases work
source ~/.bashrc

# Go to the folder
gotospot
