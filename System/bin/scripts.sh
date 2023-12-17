#!/bin/bash
#!/bin/bash
#########################################################################
#                                                                       #
# Script: scripts.sh - Script Execution                                 #           
#                                                                       #
# Author: Apollo Alves                                                  #
# Date: 10/12/2023                                                      #
#                                                                       #
#########################################################################

#########################################################################################################################
#                                                                                                                       #
# This script, named "scripts.sh," maintains an organized list of scripts to be executed.                               #
# Each script is represented as an element in the 'scripts' array, facilitating easy maintenance and addition/removal   #
# of                                                                                                                    #
# scripts.                                                                                                              #
#                                                                                                                       #
# Observations about the script:                                                                                        #
# 1. **Organization:**                                                                                                  #
# - Scripts are organized in an array named 'scripts,' making maintenance and modification straightforward.             #
# 2. **Comments:**                                                                                                      #
# - Includes an initial comment with basic information about the purpose, author, and creation date.                    #
# - Could benefit from additional comments to explain each script individually or group related scripts.                #
# 3. **Script Execution:**                                                                                              #
# - Some elements in the array represent composite scripts, where multiple scripts are executed sequentially.           #
# - Efficient approach for grouping related scripts and ensuring orderly execution.                                     #
# 4. **Simple Maintenance:**                                                                                            #
# - The array structure makes it easy to add, remove, or modify scripts without altering the logic of the main script.  #
# 5. **Finalization:**                                                                                                  #
# - Does not contain direct execution commands for the listed scripts. It may be part of a broader script that iterates #
# - over the list and executes each script.                                                                             #
# 6. **Possible Improvement:**                                                                                          #
# - Could include logic to check the existence of scripts before execution, avoiding errors if any script is missing.   #
# Overall, it is a useful script for managing the execution of various related scripts, simplifying the automation of   #
# system maintenance tasks.                                                                                             #
#                                                                                                                       #
#########################################################################################################################

scripts=(
    "update__pack.sh"
    "remove__traces.sh"
    "update__system.sh;remove__system.sh"
    "optimize__performance.sh"
    "stacer__tools.sh"
    "swap__state.sh"
    "system__analyse.sh"
    "show__journalctl.sh"
    "disable__services.sh"
    "disabled__ListServices.sh"
    "mount__extDisks.sh"
    "check__space.sh"
    "eggs__wizard.sh"
    "clonraid__backups.sh"
    "apititude__manager.sh"
    "software__properties.sh"
    "reinstall__gnome-gdm3.sh"
    "mysql__fix-1.0.sh"
    "release__upgrade.sh"
    "virtualbox_services.sh"
    "report.sh"
    "shellCare-22.0.1.sh"
    "reboot__system.sh"

)