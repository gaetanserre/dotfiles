#!/usr/bin/env bash

nb_monitors=$(hyprctl monitors | grep 'Monitor' | wc -l)
laptop_screen_available=$(hyprctl monitors | grep 'eDP' | wc -l)

backlight() {
  if [[ $nb_monitors == 1 && ($laptop_screen_available == 1)]]; then
    brightnessctl -s set 10
  fi
}

screen_off() {
  if [[ $nb_monitors == 1 && ($laptop_screen_available == 1)]]; then
    hyprctl dispatch dpms off
  fi
}

suspend_laptop() {
  if [[ $nb_monitors == 1 && ($laptop_screen_available == 1)]]; then
    systemctl suspend
  fi
}

if [[ "$1" == "--backlight" ]]; then
  backlight
elif [[ "$1" == "--screen" ]]; then
  screen_off
elif [[ "$1" == "--suspend" ]]; then
  suspend_laptop
fi