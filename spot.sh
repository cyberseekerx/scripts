#!/bin/bash

echo -e "🎵 Choose audio quality:"
echo -e "  [1] 🧊 Low Quality (128kbps)"
echo -e "  [2] 🔮 Medium Quality (192kbps)"
echo -e "  [3] 🚀 High Quality (320kbps)"
read -p "Your choice (1-3): " quality_choice

# Symbolic mapping (since spotdl doesn't support exact bitrate options)
case "$quality_choice" in
  1) tag="low";;
  2) tag="medium";;
  3) tag="high";;
  *) echo "❌ Invalid input. Defaulting to high quality."; tag="high";;
esac

read -p "🎧 Enter Spotify URL: " spotify_url

# Download attempt
echo "📥 Downloading... please wait."
output_dir="$HOME/spotdl_downloads"
mkdir -p "$output_dir"
cd "$output_dir" || exit 1

spotdl "$spotify_url" > /dev/null 2>&1

downloaded_file=$(find . -maxdepth 1 -type f -iname "*.mp3" | sort | tail -n 1)

if [[ ! -f "$downloaded_file" ]]; then
  echo -e "\n❌ Download failed with $tag quality."

  # Ask user what to do next
  echo -e "\n💡 What do you want to do?"
  echo -e "  [1] Try a different quality"
  echo -e "  [2] Retry same quality"
  echo -e "  [3] Exit"
  read -p "Choice: " retry_choice

  case "$retry_choice" in
    1)
      echo -e "\n🔁 Restarting script..."
      exec "$0"  # rerun the script from scratch
      ;;
    2)
      echo -e "\n🔁 Retrying download..."
      spotdl "$spotify_url" > /dev/null 2>&1
      ;;
    3)
      echo "👋 Okay, exiting. No file downloaded."
      exit 1
      ;;
    *)
      echo "❌ Invalid input. Exiting."
      exit 1
      ;;
  esac
else
  echo -e "\n✅ Success! File saved as: $downloaded_file"
fi
