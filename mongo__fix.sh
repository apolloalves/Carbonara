
sudo systemctl enable mongod
echo "MongoDB enable"
sudo service mongod restart



echo "mongoDB was Resinstalled"
sudo systemctl status mongod
echo "Done!"
sudo service mongod stop
sudo apt purge mongodb-org*
sudo rm -r /var/log/mongodb -y
sudo rm -r /var/lib/mongodb -y

echo "Mongod removed!"

wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

echo "update packages..."
sudo apt update

echo "install mongodb..."
sudo apt install -y mongodb-org

echo "Starting MongoDB..."
sudo systemctl daemon-reload

sudo systemctl enable mongod
echo "MongoDB enable"
sudo service mongod restart



echo "mongoDB was Resinstalled"
sudo systemctl status mongod
echo "Done!"

sudo systemctl enable mongod
echo "MongoDB enable"
sudo service mongod restart



echo "mongoDB was Resinstalled"
sudo systemctl status mongod
echo "Done!"
