bacula-fd -tc /etc/bacula/bacula-fd.conf
systemctl restart bacula-fd
systemctl enable bacula-fd
sudo mkdir -p /bacula/restore
sudo chown -R bacula:bacula /bacula
sudo chmod -R 700 /bacula

firewall-cmd --zone=public --add-port=9102/tcp --permanent
firewall-cmd --reload
