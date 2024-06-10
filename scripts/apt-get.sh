#!/bin/bash

# List of items to be installed
items=("fs@latest" "axios@latest" "express@latest" "nextlibrary-unofficial@latest" "nextlanguage-unofficial@latest")
updates=("git@latest" "node@latest" "terminal@latest")

# Function to display a loading bar
display_loading_bar() {
    local progress=0
    local total=20
    local completed="#"
    local incomplete="-"

    while [ $progress -le $total ]; do
        echo -ne "["
        for ((i=0; i<$progress; i++)); do echo -ne "$completed"; done
        for ((i=$progress; i<$total; i++)); do echo -ne "$incomplete"; done
        echo -ne "] $((($progress * 100) / $total))%\\r"
        sleep 0.1
        ((progress++))
    done
    echo -ne "\n"
}

# Main installation loop
for item in "${items[@]}"; do
    echo "Fetching Package: $item..."
    display_loading_bar
    # Here you can add the command to install the item, for example:
    # sudo apt-get install -y $item
    # npm install -y $item
    sleep 1  # Simulating installation time
done

# Main installation loop
for update in "${updates[@]}"; do
    echo "Updating Fetched Package: $update..."
    display_loading_bar
    # Here you can add the command to install the item, for example:
    # sudo apt-get install -y $item
    # npm update -y $update
    sleep 1  # Simulating installation time
done

echo "All items have been installed."
