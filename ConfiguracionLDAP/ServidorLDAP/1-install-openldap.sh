#!/bin/bash

echo " " >> /etc/hosts
read -p " IP del servidor: " ipServidor;

echo "
$ipServidor server.miRed.com server" >> /etc/hosts

echo "yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel net-tools nano";
yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel net-tools nano

#iniciando demonio del servidor ldap
echo "systemctl start slapd";
systemctl start slapd
echo "systemctl enable slapd";
systemctl enable slapd

netstat -antup | grep -i 389
 
