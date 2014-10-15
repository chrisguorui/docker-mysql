#!/bin/bash

echo "editing mysql conf"
echo "[mysqld]" > /etc/my.cnf
echo "user            = mysql" >> /etc/my.cnf
echo "pid-file        = /var/lib/mysql/mysqld.pid" >> /etc/my.cnf
echo "socket          = /var/lib/mysql/mysql.sock" >> /etc/my.cnf
echo "port            = 3306" >> /etc/my.cnf
echo "basedir         = /usr" >> /etc/my.cnf
echo "datadir         = /var/lib/mysql" >> /etc/my.cnf
echo "tmpdir          = /tmp" >> /etc/my.cnf
#echo "bind-address    = 172.17.0.139" >> /etc/my.cnf
echo "log-error = /var/log/mysqld.error.log" >> /etc/my.cnf

echo "starting mysql"
service mysqld start

if [[ ! -z "`mysql -qfsBe "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='db'" 2>&1`" ]];
then
  echo "DATABASE ALREADY EXISTS"
else
  mysql -u root -e "CREATE USER 'monty'@'localhost' IDENTIFIED BY 'some_pass';"
  mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'monty'@'localhost' WITH GRANT OPTION;"
  mysql -u root -e "CREATE USER 'monty'@'%' IDENTIFIED BY 'some_pass';"
  mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'monty'@'%' WITH GRANT OPTION;"
  mysql -u root -e "CREATE SCHEMA Stuff;"
#  mysql -u root -e "USE Stuff; CREATE TABLE stuffs (id INT, data VARCHAR(100), created_at datetime, updated_at datetime);"
#  mysql -u root -e "USE Stuff; INSERT INTO stuffs VALUES (1, 'foo', null, null); INSERT INTO stuffs VALUES (2, 'bar', null, null);"

fi

mysql 
