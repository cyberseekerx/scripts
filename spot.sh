#!/bin/bash
cd /storage/emulated/0/Music/SpotDL

echo -e "🎵 Select Audio Quality:"
echo -e "  [0] 🎧 Free Tier (128kbps)"
echo -e "  [1] 💎 better than spotify Premium Tire (320kbps)"
read -p "Your choice (0-1): " quality_choice

case "$quality_choice" in
0) quality="128k" ;;
1) quality="320k" ;;
*)
  echo "Invalid choice. Defaulting to Overkill Mode."
  quality="320k"
  ;;
esac

read -p "🎧 Enter the Spotify URL: " spotify_url

echo "📥 Downloading with SpotDL..."
spotdl "$spotify_url"

# Find the newest .mp3 file
downloaded_file=$(ls -t *.mp3 | head -n 1)

# If no file found
if [[ ! -f "$downloaded_file" ]]; then
  echo "❌ No MP3 file found. Something went wrong with the download."
  exit 1
fi

echo "🔄 Re-encoding '$downloaded_file' to bitrate: $quality"
output_file="converted_${downloaded_file}"

ffmpeg -i "$downloaded_file" -b:a "$quality" -y "$output_file"

# Optional cleanup and rename
rm "$downloaded_file"
mv "$output_file" "$downloaded_file"

echo -e "✅ Done! File saved as: $downloaded_file with bitrate: $quality"
