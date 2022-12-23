#!/bin/bash
VALIDATE=$(test "y" || "n" != "$stacer_question" || test "y" || "n" != "$timeshift_question")


 echo -n 'Do you want to open stacer ( y/n ) ? or press any key to exit '
 read -r stacer_question


 if test "n" = "$stacer_question"
                  
            then 
            echo "Generating the list of snapshots..."
            sleep 2
            sudo timeshift --delete
            echo -e '\n************************************************************************************************************\n'
            lsb_release -a      
            echo -e '\n************************************************************************************************************\n'
            neofetch 

fi

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
      
      echo -e '\n'
      echo -n 'Can I create a new snapshot containing the current state of the system ( y/n ) ? or press any key to exit '
      read -r timeshift_question

fi
 
  if test "y" = "$timeshift_question"

            then

            echo "initializing timeshift..."
            sleep 2
            echo -e "\n\033[01;31mCreating snapshot...\033[00;37m\n"
            sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.2.sh ]' --tags D
            echo -e "\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n"
            echo -e '\n************************************************************************************************************\n'
            lsb_release -a      
            echo -e '\n************************************************************************************************************\n'
            neofetch 
      fi

      if test "n" = "$timeshift_question"

                  
            then 
            echo "Generating the list of snapshots..."
            sleep 2
            sudo timeshift --delete
            echo -e '\n************************************************************************************************************\n'
            lsb_release -a      
            echo -e '\n************************************************************************************************************\n'
            neofetch 
            

      fi


      if
            echo "${VALIDATE}"
            then
            echo -e "The operation was canceled by the user\n"   

      fi