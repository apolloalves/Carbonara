#!/bin/bash

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script needs to be run as root." 
   exit 1
fi

# Get the list of all PPAs installed on the system
installed_ppas=$(find /etc/apt/sources.list.d/ -type f -name "*.list" -exec awk -F'/' '/^deb / {print $NF}' {} \; | cut -d: -f1 | sort -u)

# Check unused PPAs
unused_ppas=()
for ppa in $installed_ppas; do
    packages=$(apt-cache policy | awk '/^[[:space:]]{2}/ {print $2}' | grep "^$ppa" | wc -l)
    if [[ $packages -eq 0 ]]; then
        unused_ppas+=($ppa)
    fi
done

# Check if there are unused PPAs
if [[ ${#unused_ppas[@]} -gt 0 ]]; then
    echo "The following unused PPAs were found:"
    for ppa in "${unused_ppas[@]}"; do
        echo "  $ppa"
    done
    read -p "Do you want to remove unused PPAs? (y/n): " choice
    if [[ $choice =~ ^[Yy]$ ]]; then
        # Create backups of the files
        backup_files=()
        for ppa in "${unused_ppas[@]}"; do
            backup_file="/etc/apt/sources.list.d/$ppa.list.bak"
            echo "Creating backup: $backup_file"
            cp "/etc/apt/sources.list.d/$ppa.list" "$backup_file" > /dev/null 2>&1
            backup_files+=("$backup_file")
        done

        # Remove unused PPAs
        for ppa in "${unused_ppas[@]}"; do
            echo "Removing PPA: $ppa"
            rm -f "/etc/apt/sources.list.d/$ppa.list" > /dev/null 2>&1
        done

        apt update -y 
        echo -e "\nUnused PPAs have been successfully removed."

        echo -e "\nRemaining PPAs:"
        apt-cache policy | awk '/ppa.launchpad.net/ && /install/ {print $2}'

        # Display backup files
        echo -e "\nBackup files created:"
        for file in "${backup_files[@]}"; do
            echo "  $file"
        done

        # Restore backups if desired
        read -p "Do you want to restore the backups? (y/n): " restore_choice
        if [[ $restore_choice =~ ^[Yy]$ ]]; then
            for file in "${backup_files[@]}"; do
                echo "Restoring backup: $file"
                cp "$file" "/etc/apt/sources.list.d/$(basename "$file" .bak)" > /dev/null 2>&1
            done
            apt update -y
            echo -e "\nBackups have been successfully restored."
        fi
    else
        echo "No PPAs were removed."
        sleep 3 
       
    fi
else
    echo -e "\nNo unused PPAs were found."
fi
