#!/bin/bash
cd /var/www/html/
wget 

https://github.com/roundcube/roundcubemail/releases/download/1.4.1/roundcubemail-1.4.1-complete.tar.gz
tar -xvf roundcubemail-1.4.1-complete.tar.gz
mv roundcubemail-1.4.1 webmail

cp config.inc.php /var/www/html/webmail/config/config.inic.php

chown -R apache:apache /var/www/
chmod -R 755 /var/www/html/webmail
systemctl restart httpd

echo "Se ejecutará un comando para iniciar el servidor, cada que sea necesario iniciar el servidor deberá ejecutar el .sh IniciarServidor"
echo "Ejecutando IniciarServidor.sh"
sudo sh IniciarServidor.sh

systemctl restart httpd
systemctl restart dovecot
