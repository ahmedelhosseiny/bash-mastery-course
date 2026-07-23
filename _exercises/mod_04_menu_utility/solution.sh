#!/bin/bash
PS3="Choose an option: "
select opt in "Current Date" "Disk Usage" "Network Interfaces" "Exit"; do
    case "$opt" in
        "Current Date") date ;;
        "Disk Usage") df -h / ;;
        "Network Interfaces") ip a || ifconfig ;;
        "Exit") break ;;
        *) echo "Invalid option" ;;
    esac
done
