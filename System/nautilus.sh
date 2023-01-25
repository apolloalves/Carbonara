#!/bin/bash
     sudo nautilus /mnt/EXT__CLONRAID/ 

      if pgrep -x "nautilus" > /dev/null
      then
      until ! pgrep -x "nautilus" > /dev/null
      do
            echo -e '\cAguardando o encerramento do stacer pelo usuário...'
            sudo killall nautilus
            echo "fechado"
      done
      fi