#!/bin/bash

#####################################################################
#                                                                   #
# Script: For updates packages of system and optimizer performance. #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################


     sudo nautilus /mnt/EXT@ST500LM012__CLONRAID/

      if pgrep -x "nautilus" > /dev/null
      then
      until ! pgrep -x "nautilus" > /dev/null
      do
            echo -e '\cAguardando o encerramento do stacer pelo usuário...'
            sudo killall nautilus
            echo "fechado"
      done
      fi