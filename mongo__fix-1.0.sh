#!/bin/bash

#Restart services of mongoDB
echo -n "Would you like to restart services mongod? (y/n) "
read -r restart_service

if test "y" = "$restart_service"

then

    sudo systemctl enable mongod
    sudo service mongod restart
    echo "MongoDB restarted!"
    sudo systemctl status mongod
    echo -e '\n\033[00;37m[\033[00;32m restarted!! \033[00;37m ]\033m\n'

    elif test "n" = "$restart_service"

        then 
            echo -e '\n\033[00;37m[\033[00;32m  OK \033[00;37m ]\033m\n'
  
    elif
         test "y" || "n" != "$restart_service" 
           
        then
            echo "invalid arguments!"   
fi 

# Remove mongoDB
    echo -n "would you like remove mongoDb? (y/n)"
    read -r remove_mongoDB

    if test "y" = "$remove_mongoDB"

        then 

        sudo service mongod stop
        sudo apt autoremove -y 
        sudo apt purge mongodb-org* -y  
        sudo rm -r /var/log/mongodb -y
        sudo rm -r /var/lib/mongodb -y
        echo -e '\n\033[00;37m[\033[00;32m Removided!\033[00;37m ]\033m\n'


    elif test "n" = "$remove_mongoDB" 

        then 
            echo -e '\n\033[00;37m[\033[00;32m  OK \033[00;37m ]\033m\n'

        elif
            test "y" || "n" != "$remove_mongoDB"
            then
            echo "invalid arguments!"   

fi 

# Reinstall mongoDB 
    echo -n "would you like to reinstall mongoDb? (y/n)"
    read -r reinstall_mongoDB

    if test "y" = "$reinstall_mongoDB"

        then 

        wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
        echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
        echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
        sudo apt-get update
        sudo apt-get install -y mongodb-org
        sudo systemctl enable mongod
        sudo service mongod restart
        sudo systemctl status mongod.service
        echo -e '\n\033[00;37m[\033[00;32m  OK \033[00;37m ]\033m\n'



    elif test "n" = "$reinstall_mongoDB"

        then 
                    echo -e '\n\033[00;37m[\033[00;32m  OK \033[00;37m ]\033m\n'

    elif
        test "y" || "n" != "$reinstall_mongoDB"
        then
        echo "invalid arguments!"   

fi
