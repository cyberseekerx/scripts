# scripts
#it has all the scripts



# Create music folder
mkdir -p /storage/emulated/0/Music/SpotDL
mkdir -p /storage/emulated/0/.Ayush_spot_script_cache 
source ~/.bashrc

# this is making files 
echo 'alias gotospot="cd /storage/emulated/0/Music/SpotDL"' >> ~/.bashrc
source ~/.bashrc
cd /storage/emulated/0/.Ayush_spot_script_cache 
curl -sL https://raw.githubusercontent.com/cyberseekerx/scripts/refs/heads/main/spotdl-install.sh -o spot.sh 
echo 'alias spot="cd /storage/emulated/0/.Ayush_spot_script_cache && bash spot.sh"' >> ~/.bashrc
