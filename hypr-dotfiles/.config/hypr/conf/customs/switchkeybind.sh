#!/bin/bash

KEYBIND_CONF="/home/diazixx/dotfiles/.config/hypr/conf/keybinding.conf"

current_layout=$(cat "$KEYBIND_CONF")

if [[ "$current_layout" == "source = ~/.config/hypr/conf/keybindings/default.conf" ]]; then 
    echo "source = ~/.config/hypr/conf/keybindings/fr.conf" > $KEYBIND_CONF
else 
    echo "source = ~/.config/hypr/conf/keybindings/default.conf" > $KEYBIND_CONF
fi

hyprctl reload
