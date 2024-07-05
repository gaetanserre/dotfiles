#!/usr/bin/env bash

grep_output=$(pamixer --list-sinks | grep -Eo '[0-9]+ "')

# remove quotes
sink_list=$(echo $grep_output | tr -d '"')

# to array
IFS=' ' read -r -a sink_array <<< "$sink_list"

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
  for sink in "${sink_array[@]}"
  do
    pamixer --sink $sink -i 2
  done
}

dec_volume() {
  if check_if_mute; then
    pamixer -u
  fi
  for sink in "${sink_array[@]}"
  do
    pamixer --sink $sink -d 2
  done
}

mute_volume() {
  for sink in "${sink_array[@]}"
  do
    pamixer --sink $sink -t
  done
}

if [[ "$1" == "--inc" ]]; then
  inc_volume
elif [[ "$1" == "--dec" ]]; then
  dec_volume
elif [[ "$1" == "--mute" ]]; then
  mute_volume
fi
