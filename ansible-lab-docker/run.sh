#!/bin/bash

buildandrun() {
docker compose up $1 --build -d
}

# Define the menu function
switch_menu() {
    echo "================================="
    echo "         Choose an Option         "
    echo "================================="
    echo "1) All"
    echo "2) Alpine"
    echo "3) Archlinux"
    echo "4) RedHat"
    echo "5) Debian"
    echo "6) Ubuntu"
    echo "================================="
    read -p "Enter your choice [1-6]: " choice

    case $choice in
        1)
	        buildandrun
            ;;
        2)
	        buildandrun alpine 
            ;;
        3)
            buildandrun archlinux
            ;;
        4)
            buildandrun redhat
            ;;
        5)
            buildandrun debian
            ;;
        6)
            buildandrun ubuntu
            ;;
        *)
            echo "Invalid option, please select a number between 1 and 6."
            ;;
    esac
}

# Call the function
switch_menu
