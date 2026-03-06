#!/bin/bash

is_dark_file="$HOME/.config/cosmic/com.system76.CosmicTheme.Mode/v1/is_dark"

wallpaper_config_file="$HOME/.config/cosmic/com.system76.CosmicBackground/v1/all"
dark_bg_file="$HOME/projects/dotfiles/dotfiles/cosmic/dark_bg"
light_bg_file="$HOME/projects/dotfiles/dotfiles/cosmic/light_bg"

is_dark=$(cat $is_dark_file)

if  [[ $is_dark == "true" ]]; then
  echo "false" > $is_dark_file
  cat $light_bg_file > $wallpaper_config_file
else
  echo "true" > $is_dark_file
  cat $dark_bg_file > $wallpaper_config_file
fi
