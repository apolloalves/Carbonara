#!/bin/bash
VALIDATE=$(test "y" || "n" != "$stacer_question" || test "y" || "n" != "$timeshift_question")


 echo -n 'Do you want to open stacer? ( y/n ) '
 read -r stacer_question


 if test "y" = "$stacer_question"

    then

            echo "stacer is running..."
            sleep 1
            stacer &        

      until ! pgrep -x "stacer" > /dev/null
      
      do
            echo -e '\cAguardando o encerramento do stacer pelo usuário...'
            sleep 1
      done

      elif test "n" = "$stacer_question"


      then
            echo "initializing timeshift..."
            sleep 2
            sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.2.sh ]' --tags D
            echo -e "\033[01;31mCreating snapshot...\033[00;37m"
            echo -e "\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n"
            echo "Generating the list of snapshots..."
            sleep 2
            sudo timeshift --delete
           
      else 
            echo "${VALIDATE}"
            echo "Invalid arguments!"
fi


echo -n 'Can I create a new snapshot containing the current state of the system? ( y/n ) '
read -r timeshift_question
        

if test "y" = "$timeshift_question"

      then

            echo "initializing timeshift..."
            sleep 2
            sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.2.sh ]' --tags D
            echo -e "\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n"
            echo -e "\033[01;31mCreating snapshot...\033[00;37m"
            neofetch 
                              
      elif test "n" = "$timeshift_question"
                  
            then 
            echo "Generating the list of snapshots..."
            sleep 2
            sudo timeshift --delete
                  
      elif
            echo "${VALIDATE}"
            then
            echo "invalid arguments!"   
      
      fi

