#!/bin/bash
echo -n 'Deseja abrir o system cleaner (y/n)?'
read -r  st_question


if test "y" = "$st_question"

        then
                echo "initializing stacer..."
                #stacer &        
                #echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'
                
                #echo "initializing timeshift..."
                #sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.0.sh ]' --tags D
                #echo -e '\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n'
                
                #neofetch

       elif test "n" = "$st_question"
        echo -n 'Can I create a new snapshot containing the current state of the system? (y/n)'
        then
       
        read -r  ts_question

                if test "y" = "$ts_question"

                        then
                                echo "initializing timeshift..."
                                #sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.0.sh ]' --tags D
                                #echo -e '\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n'
                                #echo -e "\033[01;31mCreating snapshot...\033[00;37m"
                                #neofetch

                        elif test "n" = "$ts_question"
                        then 
                                echo "Generating the list of snapshots..."
                                #sudo timeshift --delete
                                #neofetch

                      
                 


                fi 

       



fi




