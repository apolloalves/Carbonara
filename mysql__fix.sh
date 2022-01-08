

echo "Initilizing Install mysql-server..."
sudo apt install mysql-server
mysql_secure_installation
echo "Done!"

mysql -u root -p



sudo apt remove --purge mysql-server
sudo apt remove --purge phpmyadmin 

echo 'STOPING SERVICES'
/etc/init.d/mysql stop

echo 'Removing mysql-common...'
sudo apt remove --purge mysql-common

echo 'Removing mysql...'
rm -rf /var/lib/mysql

echo 'Updating packages of system'
sudo apt update

echo 'display list mysql-server'
dpkg -l mysql-server 

echo "*********************************************************************************************************"

echo "The installation of the mysql-server package has been successfully removed\n"

echo "*********************************************************************************************************"

echo "Initilizing Install mysql-server..."
sudo apt install mysql-server
mysql_secure_installation
echo "Done!"

mysql -u root -p



