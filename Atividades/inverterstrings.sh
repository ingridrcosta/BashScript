#!/bin/bash


####################################################################

#Crie um script Bash que solicite ao usuário que digite uma frase. 
#Em seguida, o script deve inverter a ordem dos caracteres na frase e exibir a frase invertida.

####################################################################
echo "Hello Word"


echo "Invertendo a frase"

read -p "Digite uma frase: " frase

inverso=""


for (( i=${#frase}-1; i>=0; i--));
do
    caractere="${frase:i:1}"
    inverso="$inverso$caractere"
    echo "$inverso"
done
 echo "Frase invertida: $inverso"