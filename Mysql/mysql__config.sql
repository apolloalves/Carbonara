  
            USE mysql;
            SELECT User, Host, plugin FROM mysql.user;   
            UPDATE user SET plugin='mysql_native_password' WHERE User='root';
            FLUSH PRIVILEGES;
            
