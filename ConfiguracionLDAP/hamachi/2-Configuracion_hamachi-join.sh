#!/bin/bash

# nombre cliente
read -p "nombre del cliente: " nick;
echo "sudo hamachi set-nick $nick";
sudo hamachi set-nick $nick

# --Registrar correo electronico 
read -p "Ingrese su correo electronico hamachi: " correo;
echo "sudo hamachi attach $correo";
sudo hamachi attach $correo

# Registrando red hamachi
read -p "Ahora ingrese el ID de la red hamachi: " red;
echo "Sudo hamachi join $red ";
sudo hamachi join $red
