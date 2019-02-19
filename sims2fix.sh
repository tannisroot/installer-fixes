#!/bin/bash

simsmodcheck() {
    # This will only check for the presence of the word "sims", insensitive to case, and ignore the "Ultimate Collection" path
    # Probably not advisable on a prefix with multiple sims games installed
    if [[ $(find . -type d -iname "*sims*" -not -path "*Ultimate Collection*") ]]; then
      find . -type d -iname "*sims*" -not -path "*Ultimate Collection*" | while read _simsdocdir; do
        echo "$_simsdocdir found"
        # if ./Downloads doesn't exist, create it
        if [[ ! -d "$_simsdocdir"/Downloads ]]; then
          mkdir -p "$_simsdocdir"/Downloads
        fi
        # if ./Config doesn't exist, create it
        if [[ ! -d "$_simsdocdir"/Config ]]; then
          mkdir -p "$_simsdocdir"/Config
        fi
        ln -s "$_supposedly_universal_basedir"/Downloads/* "$_simsdocdir"/Downloads/ && echo "$_supposedly_universal_basedir/Downloads content symlinked to $_simsdocdir/Downloads"
        ln -s "$_supposedly_universal_basedir"/Config/* "$_simsdocdir"/Config/ && echo "$_supposedly_universal_basedir/Config content symlinked to $_simsdocdir/Config"
        echo ""
      done
    else
      echo "No additional Sims-related subdir found"
    fi
}

  cd "./drive_c/users/$USER/My Documents/EA Games" && echo "using './drive_c/users/$USER/My Documents/EA Games' as base dir to search for mods" && echo ""

  # The Sims™ 2 Ultimate Collection assumed to be what's used
  _supposedly_universal_basedir="./drive_c/users/$USER/My Documents/EA Games/The Sims™ 2 Ultimate Collection"
  
  simsmodcheck
