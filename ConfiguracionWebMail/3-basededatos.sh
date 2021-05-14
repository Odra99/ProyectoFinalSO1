create database roundcubedb;
create user roundcubeuser@localhost identified by 'roundcubepwd';
grant all on roundcubedb.* to roundcubeuser@localhost;
flush privileges;
exit;\n
