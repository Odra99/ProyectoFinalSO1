#!/bin/bash

DOCUMENTO=passwd.txt
pass=""

if [ -f $DOCUMENTO ]
then
   rm passwd.txt
   touch passwd.txt 
else
   touch passwd.txt
fi 

echo "slappasswd";
slappasswd >> passwd.txt


while IFS= read -r line
   do
	  pass=$line
   done < passwd.txt
   
echo "olcRootPW: $pass" >> db.ldif

echo "ldapmodify -Y EXTERNAL  -H ldapi:/// -f db.ldif";
ldapmodify -Y EXTERNAL  -H ldapi:/// -f db.ldif
echo "ldapmodify -Y EXTERNAL  -H ldapi:/// -f permiss-modify.ldif";
ldapmodify -Y EXTERNAL  -H ldapi:/// -f permiss-modify.ldif
echo "ldapmodify -Y EXTERNAL  -H ldapi:/// -f monitor.ldif";
ldapmodify -Y EXTERNAL  -H ldapi:/// -f monitor.ldif
 
