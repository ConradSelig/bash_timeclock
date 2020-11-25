#!/bin/bash

source "./select_option.sh"

running=1
while [[ "$running" -eq 1 ]]; do
    clear
    echo "Welcome back."
    echo
    echo "Select one option using up/down keys and enter to confirm:"
    echo
    
    options=("Select Project" "Clock Out" "View Reports", "Exit")
    
    select_option "${options[@]}"
    choice=$?
    clear

    # Clocking In
    if [[ $choice == 0 ]]; then
        options=()
        clock_files=`ls ./Clocks/*.clock`
        for next_clock in $clock_files; do
            options+=("${next_clock#"./Clocks/"}")
        done
        options+=("Create New Project" "Exit")

        clear
        echo "Select a project to clock into."
        echo

        select_option "${options[@]}"
        choice=$?
        clear

        # special case for if a new project is being created
        if [[ $choice == `expr ${#options[@]} - 2` ]]; then
            echo -n "Enter the name for your new project (or enter nothing to exit): "
            read new_name
            if [[ ${#new_name} -gt 0 ]]; then
                touch ./Clocks/$new_name.clock
            else
                continue
            fi
            selected_clock=${new_name}
        elif [[ $choice == `expr ${#options[@]} - 1` ]]; then
            continue
        else
            selected_clock=${options[$choice]}
        fi

        clear
      
        echo -n "Currently selected project: "
        echo $new_name
        echo -n "Current project pay: "
        echo "tmp"
        echo

        options=("Clock In" "Change Project Name" "Change Project Pay" "Delete Project" "Return to Main Menu")
        select_option "${options[@]}"
        choice=$?
        clear


    # Clocking Out
    elif [[ $choice == 1 ]]; then
        echo "        value = ${options[$choice]}"
    # Run Reports
    elif [[ $choice == 2 ]]; then
        echo "        value = ${options[$choice]}"
    # Exit
    else
        clear
        running=0
    fi
done

