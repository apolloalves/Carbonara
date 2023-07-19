#!/bin/bash


#####################################################################
#                                                                   #
# Script: remove_unused_ppa.sh                                      #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 17/07/2023                                                  #
#                                                                   #
#####################################################################


############################################################################################################################
#                                                                                                                          #
#                                                                                                                          #
# The "remove_unused_ppas.sh" script is a tool designed to identify and remove unused PPAs on an Ubuntu or Debian          #
# based system. PPAs (Personal Package Archives) are third-party repositories that can be added to the system to           #
# provide additional packages not available in the official repositories.                                                  #
#                                                                                                                          #
# The purpose of the script is to help clean and optimize the system by removing PPAs that are no longer used. These PPAs  #
# may have been added earlier to install specific packages, but if those packages are no longer installed or available,    #
# the PPAs become unnecessary.                                                                                             #
#                                                                                                                          #
# The script works as follows:                                                                                             #
#                                                                                                                          #
# 1. Identifies all PPAs installed on the system.                                                                          #
# 2. Checks which PPAs don't have packages installed from them.                                                            #
# 3. Displays a list of unused PPAs.                                                                                       #
# 4. Asks the user if they want to remove unused PPAs.                                                                     #
# 5. If yes, remove selected PPAs.                                                                                         #
# 6. Updates the APT cache to reflect the changes.                                                                         #
#                                                                                                                          #
# The script is useful for keeping a clean and tidy system by removing unused PPAs that can take up disk space and         #
# potentially cause package conflicts on the system.                                                                       #
#                                                                                                                          #
# I hope this description is helpful to understand the purpose and functionality of "remove_unused_ppas.sh" script. If you #
# have more questions, please let me know.                                                                                 #
#                                                                                                                          #
#                                                                                                                          #
############################################################################################################################

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script needs to be run as root." 
   exit 1
fi

# Get the list of all PPAs installed on the system
installed_ppas=$(find /etc/apt/sources.list.d/ -type f -name "*.list" -exec awk -F'/' '/^deb / {print $NF}' {} \; | cut -d: -f1)

# Check unused PPAs
unused_ppas=()
for ppa in $installed_ppas; do
    packages=$(apt-cache policy | awk '/^[[:space:]]{2}/ {print $2}' | grep "^$ppa" | wc -l)
    if [[ $packages -eq 0 ]]; then
        unused_ppas+=($ppa)
    fi
done

# Remove unused PPAs
if [[ ${#unused_ppas[@]} -gt 0 ]]; then
    echo "The following PPAs are not being used:"
    for ppa in "${unused_ppas[@]}"; do
        echo "  $ppa"
    done
    read -p "Do you want to remove unused PPAs? (y/n): " choice
    if [[ $choice =~ ^[Yy]$ ]]; then
        for ppa in "${unused_ppas[@]}"; do
            sed -i "/^deb.*$ppa/d" /etc/apt/sources.list /etc/apt/sources.list.d/*.list
        done
        apt update -y 
        echo "Unused PPAs have been successfully removed."
    else
        echo "No PPA has been removed."
    fi
else
    echo -e "\nNo unused PPAs were found."
fi


