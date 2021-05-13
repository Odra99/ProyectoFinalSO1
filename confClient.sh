bacula-fd -tc /etc/bacula/bacula-fd.conf
systemctl restart bacula-fd
systemctl enable bacula-fd
mkdir -p /bacula/restore
chown -R bacula:bacula /bacula
chmod -R 700 /bacula

firewall-cmd --zone=public --add-port=9102/tcp --permanent
