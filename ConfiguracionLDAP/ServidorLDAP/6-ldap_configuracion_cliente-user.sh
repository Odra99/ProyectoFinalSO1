#!/bin/bash

yum install -y openldap-clients nss-pam-ldapd net-tools
read -p "del servidor: " ip;
authconfig --enableldap --enableldapauth --ldapserver=$ip --ldapbasedn="dc=miRed,dc=com" --enablemkhomedir --update

#configrando autentificacion
systemctl restart nslcd
systemctl enable nslcd --now
