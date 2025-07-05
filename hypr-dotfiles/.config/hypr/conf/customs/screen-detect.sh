#!/bin/bash

# Get informations on monitors
MONITOR_INFO=$(hyprctl monitors)

# Detect if HDMI-A-1 is connected
if echo "$MONITOR_INFO" | grep -q "HDMI-A-1"; then
    # Verify which model it is
    MODEL=$(echo "$MONITOR_INFO" | grep -A 10 "HDMI-A-1")
    if echo "$MODEL" | grep -qi "VX2457"; then
        # Viewsonic VX2457 from home placed on the left
        hyprctl keyword monitor "HDMI-A-1,1920x1080@74.99,-1920x0,auto"
    elif echo "$MODEL" | grep -qi "HDMI"; then
        # Yodoit screen from Grenoble
        hyprctl keyword monitor "HDMI-A-1,1920x1080@60.00,1920x0,1"
    elif echo "$MODEL" | grep -qi "HP 22cwa"; then
        # Screen from the MAPLE Lab at Vanderbilt
        hyprctl keyword monitor "HDMI-A-1,1920x1080@60.00,1920x0,1"
	elif echo "$MODEL" | grep -qi "DELL U3818DW"; then
		# Screen from VISE
		hyprctl keyword monitor "HDMI-A-1,3840x1600@59.99,-3840x-520,auto"
	elif echo "$MODEL" | grep -qi "SAMSUNG"; then
		# Screen from VISE
		hyprctl keyword monitor "HDMI-A-1,4096x2160@60.00,1920x0,auto"
    else
        # No side screen detected -> disabling
        hyprctl keyword monitor "HDMI-A-1,disable"
    fi
fi

