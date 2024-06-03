#!/usr/bin/env bash

get_nb_updates() {
  num_updates=$(($(dnf check-update | wc -l) - 2))
  echo $(( $num_updates > 0 ? $num_updates : 0 ))
}

update() {
  sudo dnf update && sudo dnf upgrade && notify-send 'The system has been updated!'
}

if [[ "$1" == "--get" ]]; then
  get_nb_updates
elif [[ "$1" == "--update" ]]; then
  update
fi