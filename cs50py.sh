#!/bin/bash
#python study workspace
hyprctl dispatch workspace 1
hyprctl dispatch exec "kitty -e sh -lc '/usr/bin/tmux a -t cs50p || /usr/bin/tmux  exec bash'"
sleep 2
hyprctl dispatch exec brave "https://www.youtube.com/playlist?list=PLhQjrBD2T3817j24-GogXmWqO5Q5vYy0V \
https://cs50.harvard.edu/python/psets/6/ \
https://github.com/cyberseekerx"
sleep 3
hyprctl dispatch workspace 10
hyprctl dispatch exec kitty "~/Videos/"
