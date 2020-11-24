#!/bin/bash

source "./select_option.sh"

running=1
while [[ "$running" -eq 1 ]]; do
    clear
    echo "Welcome back."
    echo ""
    echo "Select one option using up/down keys and enter to confirm:"
    echo
    
    options=("Clock In" "Clock Out" "View Reports", "Exit")
    
    select_option "${options[@]}"
    choice=$?
    clear

    if [[ $choice == 0 ]]; then
        echo "        value = ${options[$choice]}"
    elif [[ $choice == 1 ]]; then
        echo "        value = ${options[$choice]}"
    elif [[ $choice == 2 ]]; then
        echo "        value = ${options[$choice]}"
    else
        clear
        running=0
    fi
done

