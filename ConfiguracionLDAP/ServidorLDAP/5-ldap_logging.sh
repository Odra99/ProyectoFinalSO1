echo "local4.*	/var/log/ldap.log" >> /etc/rsyslog.conf
echo "systemctl restart rsyslog";
systemctl restart rsyslog 
