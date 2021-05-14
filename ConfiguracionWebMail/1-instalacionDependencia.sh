#actualizar repositorios
yum update -y

#!/bin/bash
#instalar paquetes
yum install httpd httpd-tools mariadb-server mariadb php php-fpm php-mysqlnd php-opcache php-gd php-xml php-mbstring php-json php-intl php-ldap

yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum update && yum install epel-release
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install yum-utils
echo "Ingrese la versión de su php Ejemplo si es 7.4 o 7.4.1 ingrese 74\n"
php -v
echo "\n"
read version_php
yum-config-manager --enable remi-php$version_php    
yum install php-opcache
systemctl start httpd
systemctl start mariadb
systemctl enable httpd
systemctl enable mariadb
firewall-cmd --permanent --add-service=http
firewall-cmd --reload

echo "Es necesario configurar la base de datos y configurar, para ello ejecute el comando <mysql_secure_installation>\n"
echo "Finalizada la configuración iniciaremos sesión con <mysql -u root -p> y ejecutaremos los siguientes comandos:\n"



SCRIPT DE LA CREACION DE LA BASE DE DATOS

create database roundcubedb;
create user roundcubeuser@localhost identified by 'roundcubepwd';
grant all on roundcubedb.* to roundcubeuser@localhost;
flush privileges;
exit;\n


