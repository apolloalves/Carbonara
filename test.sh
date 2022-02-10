#!/bin/bash
echo -n 'Deseja abrir o system cleaner (y/n)?'
read cl_question

if test "y" = "$cl_question"
then
	echo "initializing stacer..."
	stacer &        
        echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'
        
        echo "initializing timeshift..."
        sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.0.sh ]' --tags D
        echo -e '\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n'
        
        neofetch

elif test "y" || "n" != "$cl_question"
                
                then
                echo "incorrect answer!"
                

elif test "n" = "$cl_question"
        echo -n 'Can I create a new snapshot containing the current state of the system? (y/n)'
        then
       
        read ts_question

                if test "y" = "$ts_question"

                        then
                                echo "initializing timeshift..."
                                sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.0.sh ]' --tags D
                                echo -e '\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n'
                                #echo -e "\033[01;31mCreating snapshot...\033[00;37m"
                                neofetch

                        elif test "n" = "$ts_question"
                        then 
                                echo "Generating the list of snapshots..."
                                sudo timeshift --delete
                                neofetch

                        elif test "y" || "n" != "$ts_question"
                        then
                        # echo "Command not found!"
                        echo "incorrect answer!"


        fi 
fi
