#!/bin/bash

echo "firewall-cmd --permanent --add-service=ldap";
echo "firewall-cmd --reload";

firewall-cmd --permanent --add-service=ldap
firewall-cmd --reload

echo "local.*	/var/log/ldap.log" >> /etc/rsyslog.conf
 
