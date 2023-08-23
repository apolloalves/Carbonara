#!/bin/bash

MENU='shellCare-23.0.4.sh'

VALIDATE=$(test "y" || "n" != "$stacer_question")     
 echo -n 'Do you want to open stacer ( y/n ) ? or press any key to exit '
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

fi

if
      echo "${VALIDATE}"
      then
      echo -e "The operation was canceled by the user\n"   

fi