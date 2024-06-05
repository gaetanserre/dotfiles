#!/usr/bin/env bash

get_nb_updates() {
  num_updates=$(($(dnf check-update | wc -l) - 2))
  num_updates=$(( $num_updates > 0 ? $num_updates : 0 ))
  if [ $num_updates -eq 0 ]; then
    echo "Up to date"
  elif [ $num_updates -eq 1]; then
    echo "$num_updates update"
  else
    echo "$num_updates updates"
  fi
}

update() {
  sudo dnf update && sudo dnf upgrade && notify-send 'The system has been updated!'
}

if [[ "$1" == "--get" ]]; then
  get_nb_updates
elif [[ "$1" == "--update" ]]; then
  update
fi