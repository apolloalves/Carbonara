#!/bin/bash
echo -n 'Would you like to remove mysql from the system? (y/n)'
read -r mysql_question

if test "y" = "$mysql_question"

then 
    sudo apt remove --purge mysql-server
    sudo apt remove --purge phpmyadmin 

    echo 'stoping services of mysql...'
    /etc/init.d/mysql stop

    echo 'Removing traces of packages...'
    sudo apt remove --purge mysql-common
    echo 'Removing mysql...'
    rm -rf /var/lib/mysql
    echo 'mysql was removided'

    elif test "n" = "$mysql_question"
    
    then
        echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'

      elif
            test "y" || "n" != "$mysql_question" 
            then
            echo "invalid arguments!"   
fi 


    echo -n 'Deseja reinstalar o mysql? (y/n)'
    read -r mysql_reinstall

if test 'y' =  '$mysql_reinstall'
    
    then

            echo 'Updating packages of system'
            sudo apt update

            echo 'display list mysql-server'
            dpkg -l mysql-server 

            echo "Initilizing Install mysql-server..."
            sudo apt install mysql-server
            mysql_secure_installation
            echo "Done!"

            mysql -u root -p

  elif test 'n' = "$mysql_reinstall"      
  then 
    echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'


     elif
            test "y" || "n" != '$mysql_reinstall'
            then
            echo "invalid arguments!"   

fi










