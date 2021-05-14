#!/bin/bash

read -p "Escribanombre del usuario que desea eliminar: " nombre;


ldapdelete -W -D "cn=admin,dc=miRed,dc=com" "uid=$nombre,ou=People,dc=miRed,dc=com"
