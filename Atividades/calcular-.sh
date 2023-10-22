#!/bin/bash

#########################################################################################
	
	#Atividades em Bash script
	
	#Crie um script Bash que funcione como uma calculadora simples. 
	#O script deve pedir ao usuário que insira dois números e, em seguida, 
	#perguntar qual operação matemática deseja realizar 
	#(adição, subtração, multiplicação ou divisão).
	#Com base na escolha do usuário, o script deve executar a operação apropriada e exibir o resultado.

#########################################################################################


echo "Hello Word"
echo "###################################################################################"

echo "Calculadora"


read -p "Digite o primeiro número: " numero01
read -p "Digite o segundo número: " numero02
read -p "Digite o operador: " operador

if [[ $operador = "+" ]]; 
then
	resultado=$(( numero01 + numero02 ))
	echo "$resultado"

	else 
		if [[ $operador = "-" ]];
		then
			resultado=$(( numero01 - numero02 ))
			echo "$resultado"
		else
			if [[ $operador = "*" ]];
				then
					resultado=$(( numero01 * numero02 ))
					echo "$resultado"

			else 
				if [[ $operador = "/" ]];
					then
						if ((numero02 == 0));
						then	
							echo "Erro: Divisão por zero"
							else
								resultado=$(bc -l <<< "scale=2; $numero01 / $numero02")
								echo "$resultado"
					fi
				fi
			fi	
		fi			
	fi


