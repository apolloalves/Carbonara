#!/bin/bash

#####################################################################
#                                                                   #
# Script: For updates packages of system and optimizer performance. #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

MENU="shellCare-22.0.1.sh"
YES="y"
NO="n"



 echo -n 'Do you want to open stacer ( y/n ) ? '
 read -r stacer_question

 if test "y" = "$stacer_question"

    then

      echo "stacer is running..."
      sleep 2
      stacer &        

      until ! pgrep -x "stacer" > /dev/null
      
      do
            echo -e '\cAguardando o encerramento do stacer pelo usuário...'
            sleep 2
      done
    
      $MENU;
      

fi

 if test "n" = "$stacer_question"
                  
            then 
            $MENU;


elif [ "$stacer_question" != "$YES" ] && [ "$stacer_question" != "$NO" ]; then
    
    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
    sleep 2
    $MENU

fi