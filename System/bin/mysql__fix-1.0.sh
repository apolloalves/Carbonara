#!/bin/bash

#####################################################################
#                                                                   #
# Script: mysql__fix-1.0.sh                                         #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

###################################################################################################
#                                                                                                 #
#                                                                                                 #
# The provided script performs the following actions:                                             #
#                                                                                                 #
# 1. Asks the user if he wants to remove MySQL from the system.                                   #
# 2. If the answer is "y" (yes), perform the following steps:                                     #
# - Removes the `mysql-server` and `phpmyadmin` package.                                          #
# - Stops MySQL services.                                                                         #
# - Removes traces of packages.                                                                   #
# - Removes the `/var/lib/mysql` directory.                                                       #
# - Removes the `mysql-workbench-community` package.                                              #
# - Reinstalls MySQL if the user wants to.                                                        #
# 3. If the answer is "n" (no), it displays a success message.                                    #
# 4. If the answer is neither "y" nor "n", display an invalid argument message.                   #
# 5. If the user wants to reinstall MySQL, perform the following steps:                           #
# - Update system packages.                                                                       #
# - Displays the list of `mysql-server` packages.                                                 #
# - Installs the `mysql-server` package.                                                          #
# - Reinstalls MySQL Workbench.                                                                   #
# - Fixes a connection error with the database server.                                            #
# - Restarts the MySQL service.                                                                   #
# - Displays a message to run a command within the MySQL instance.                                #
#                                                                                                 #
# In summary, the script offers the option to remove or reinstall MySQL on the system, performing #
# the necessary steps for each case.                                                              #
#                                                                                                 #
#                                                                                                 #
###################################################################################################

echo -n 'Would you like to remove mysql from the system? (y/n) '
read -r mysql_question

if test "y" = "$mysql_question"

then 
    sudo apt remove --purge mysql-server -y 
    sudo apt remove --purge phpmyadmin -y 

    echo 'stoping services of mysql...'
    /etc/init.d/mysql stop

    echo 'Removing traces of packages...'
    sudo apt remove --purge mysql-common
    echo 'Removing mysql...'
    rm -rfv /var/lib/mysql
    echo 'mysql was removided'
    sleep 1 
    echo 'Removing mysqlmysql-workbench-community...'
    snap remove mysql-workbench-community
    echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'

    elif test "n" = "$mysql_question"
    
    then
        echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'

      elif
            test "y" || "n" != "$mysql_question" 
            then
            echo "invalid arguments!"   
fi 

    echo -n 'Deseja reinstalar o mysql? (y/n) '
    read -r mysql_reinstall

if test 'y' =  "$mysql_reinstall"
    
    then

            echo 'Updating packages of system'
            sudo apt update -y 

            echo 'display list mysql-server'
            dpkg -l mysql-server 

            echo "Initilizing Install mysql-server..."
            sudo apt install mysql-server -y    
            #mysql_secure_installation
            echo "Done!"
            echo "Reinstall Workbench..."
            sudo snap install mysql-workbench-community 
            echo "Fixing error connect database server ..;"
            sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service
            echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'
            sudo service mysql restart  
            sudo systemctl status mysql.service
            echo -e '\033[05;37mEXECUTE THE COMMAND SOURCE INSIDE MYSQL INSTANCE!\033[00;37m'
            echo ''
            sudo mysql -u root
            #source /home/apollo/gnu-bash/Mysql/mysql__config.sql

  elif test 'n' = "$mysql_reinstall"      
  then 
    echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'


     elif
            test "y" || "n" != "$mysql_reinstall"
            then
            echo "invalid arguments!"   

fi










