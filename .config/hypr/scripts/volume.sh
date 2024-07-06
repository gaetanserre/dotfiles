#!/usr/bin/env bash

check_if_mute() {
  mute_status=$(pamixer --get-mute)
  if [[ "$mute_status" == "true" ]]; then
    true
  else
    false
  fi
}

inc_volume() {
  if check_if_mute; then
    pamixer -u
  fi
  pamixer -i 2
}

dec_volume() {
  if check_if_mute; then
    pamixer -u
  fi
  pamixer -d 2
}


if [[ "$1" == "--inc" ]]; then
  inc_volume
elif [[ "$1" == "--dec" ]]; then
  dec_volume
fi