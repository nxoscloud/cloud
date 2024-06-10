#!/bin/bash

# Windows 11 logo ASCII art
windows_logo="
      :::::::::::::::::::::
   .:ok0XNNNNNNNNNNNNNNXK0kdc.
  .dKNNNNNNNNNNNNNNNNNNNNNNXKd.
 .xNNNNNNNNNNNNNNNNNNNNNNNNNNNKo.
.xNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNKo.
xNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNo
xNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNo
.xNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNKo.
 .xNNNNNNNNNNNNNNNNNNNNNNNNNNNNKo.
  .dKNNNNNNNNNNNNNNNNNNNNNNNNXKd.
   .:ok0XNNNNNNNNNNNNNNNNXK0kdc.
      :::::::::::::::::::::
"

# Function to display spinning loader
display_spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Display Windows 11 logo
clear
echo "$windows_logo"
echo "Starting Windows Cloud 11..."

# Run a sleep command in the background for 20 minutes and display spinner
(sleep 20) &
display_spinner

echo -e "\nWindows Cloud 11 has finished booting."
