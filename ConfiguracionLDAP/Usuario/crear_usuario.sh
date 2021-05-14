#!/bin/bash

read -p "Escriba el nombre del nuevo usuario: " usuario;
touch $usuario.ldif
echo "dn: uid=$usuario,ou=People,dc=miRed,dc=com
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: $usuario
uid: $usuario" >> $usuario.ldif

FICHERO=passwd.txt
clave=""

if [ -f $FICHERO ]
then
   rm passwd.txt
   touch passwd.txt 
else
   touch passwd.txt
fi 

slappasswd >> passwd.txt


while IFS= read -r line
   do
	  clave=$line
   done < passwd.txt

echo "userPassword: $clave
shadowLastChange: 17058
shadowMin: 0
shadowMax: 99999
shadowWarning: 7
loginShell: /bin/bash" >> $user.ldif



FICHERO=count-user.txt
num=0

if [ -f $FICHERO ]
then
   while IFS= read -r line
   do
	  num=$(($line + 1))
   done < count-user.txt
   echo $num | tee count-user.txt
else
   touch count-user.txt
   num=1020
   echo "1020" >> count-user.txt
fi 

echo "uidNumber: $num
gidNumber: 100
homeDirectory: /home/$user" >> $usuario.ldif


read -p "Escriba password der servidor LDAP: " paswd;
ldapadd -f $usuario.ldif -D cn=admin,dc=apex,dc=com -w $paswd
echo "El usuario ha sido agregado con exito"
 
