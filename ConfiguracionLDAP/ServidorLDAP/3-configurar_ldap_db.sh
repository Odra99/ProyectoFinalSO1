#!/bin/bash

cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
echo "chown ldap:ldap /var/lib/ldap/*";
chown ldap:ldap /var/lib/ldap/*

echo "ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif";
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
echo "ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif ";
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif 
echo "ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif";
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif

echo "ldapadd -x -W -D "cn=admin,dc=miRed,dc=com" -f base.ldif"
ldapadd -x -W -D "cn=admin,dc=miRed,dc=com" -f base.ldif

