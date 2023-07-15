#!/bin/bash
#########################################################################
#                                                                       #
# Script: line.sh - Enter a line after each command                     #           
#                                                                       #
# Author: Apollo Alves                                                  #
# Date: 14/07/2023                                                      #
#                                                                       #
#########################################################################

#############################################################################################################
# Description : This bash code creates a line containing 90 trace characters (─) and prints this line on    #
# the console.                                                                                              #
# Here is a step by step description of what the code does:                                                 #
#                                                                                                           #
# The line variable is initialized as an empty string:                                                      #
# Then a loop is used to ite from 0 to 89 (90 times) and build the line by adding the character "─" (trace) #
# to the line variable with each iteration:                                                                 #
# Finally, the Printf command is used to print the line on the console.                                     #
#                                                                                                           #
#############################################################################################################

line=""

for ((i=0; i<90; i++)); do
    line+="─"
done

printf "%s\n" "$line"
