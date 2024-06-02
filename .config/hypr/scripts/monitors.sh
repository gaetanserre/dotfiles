#!/usr/bin/env bash

nb_monitors=$(hyprctl monitors | grep 'Monitor' | wc -l)

if [ $nb_monitors -lt 1 ]; then
    suspend
fi