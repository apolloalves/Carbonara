/*************************************************************
 * Script details : for mysl autentication : root and apollo *
 * Author : Apollo Alves                                     *
 * Create : 25/01/2023                                       *
 *************************************************************/

    USE mysql;
    UPDATE user SET plugin='mysql_native_password' WHERE User='root';

    CREATE USER 'apollo'@'localhost' IDENTIFIED BY '3109';
    GRANT ALL PRIVILEGES ON *.* TO 'apollo'@'localhost';
    UPDATE user SET plugin='auth_socket' WHERE User='apollo';
    FLUSH PRIVILEGES;
    SELECT User, Host, plugin FROM mysql.user;   
    FLUSH PRIVILEGES;
            
