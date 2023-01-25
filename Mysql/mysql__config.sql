  
            USE mysql;
            UPDATE user SET plugin='mysql_native_password' WHERE User='root';
            -- 2
            CREATE USER 'apollo'@'localhost' IDENTIFIED BY '3109';
            GRANT ALL PRIVILEGES ON *.* TO 'apollo'@'localhost';
            UPDATE user SET plugin='auth_socket' WHERE User='apollo';
            FLUSH PRIVILEGES;
            SELECT User, Host, plugin FROM mysql.user;   
            FLUSH PRIVILEGES;
            
