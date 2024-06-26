#!/usr/bin/env bash

get_nb_updates() {
  num_updates=$(($(dnf check-update | wc -l) - 2))
  num_updates=$(( $num_updates > 0 ? $num_updates : 0 ))
  if [ $num_updates -eq 0 ]; then
    echo "À jour"
  elif [ $num_updates -eq 1 ]; then
    echo "$num_updates mise à jour"
  else
    echo "$num_updates mises à jour"
  fi
}

update() {
  sudo dnf update --refresh --best --allowerasing && sudo dnf upgrade --refresh --best --allowerasing && notify-send 'Le système a été mis à jour !'
}

if [[ "$1" == "--get" ]]; then
  get_nb_updates
elif [[ "$1" == "--update" ]]; then
  update
fi