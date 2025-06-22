#!/bin/bash

# Check if Nmap is installed
if ! command -v nmap &> /dev/null; then
    echo "Error: nmap is not installed."
    read -p "Install Nmap now? [Y/n] " choice
    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
        echo "Installing nmap...."
        sudo apt update && sudo apt install nmap -y || {
            echo "Failed to install Nmap. Exiting."
            exit 1
        }
    else 
        echo "Please install Nmap and try again."
        exit 1
    fi
fi

read -p "Enter target network (e.g., 192.168.1.0/24): " target
echo "Starting nmap scan..."
nmap -sn "$target" 
echo "Scan complete."
