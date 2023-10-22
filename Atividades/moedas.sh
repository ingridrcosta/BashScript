#!/bin/bash
##########################################################################################################################################################

#Versao 01

#Atividade N.º1 do livro - Algorítmos e Lógica da Programação: Um texto Introdutório Para a Engenharia Pag-24 Cap. 1.6
#Enunciado: 
#1.1 Descreva como descobrir a moeda falsa em um grupo de cinco moedas
#fazendo uso de uma balança analítica (sabe-se que a moeda falsa é mais leve que as outras)
#com o menor número de pesagens possível. Lembre-se de que sua declaração deve resolver
#o problema para qualquer situação. 


#Errata: não tem o modo balança, apenas classsificação, uma nova versão será adicionada com a balança
##########################################################################################################################################################

moeda01=1
moeda02=2
moeda03=0
moeda04=4
moeda05=5

if [[ "$moeda01" -ge 1 ]]; 
then
	echo "Moeda verdadeira $moeda01"

else
	echo "Moeda falsa $moeda01"

fi

if [[ "$moeda02" -ge 1 ]]; 
then
	echo "Moeda verdadeira $moeda02"

else
	echo "Moeda falsa $moeda02"

fi
if [[ "$moeda03" -ge 1 ]]; 
then
	echo "Moeda verdadeira $moeda03"

else
	echo "Moeda falsa $moeda03"

fi

if [[ "$moeda04" -ge 1 ]]; 
then
	echo "Moeda verdadeira $moeda04"

else
	echo "Moeda falsa $moeda04"

fi
if [[ "$moeda05" -ge 1 ]]; 
then
	echo "Moeda verdadeira $moeda05"

else
	echo "Moeda falsa $moeda05"

fi
