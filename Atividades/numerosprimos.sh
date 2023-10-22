#!/bin/bash


####################################################################

#Crie um script Bash que solicite ao usuário que insira um número inteiro positivo n. 
#O script deve verificar se o número n é um número primo e, em seguida, 
#exibir uma mensagem informando se o número é primo ou não.
#
#Lembrando que um número primo é um número que é divisível apenas por 1 e por ele mesmo.

####################################################################

echo "Hello Word"

echo "####################################################################"

echo "Calculo de Números Primos"


read -p "Digite um número: " numero
contar=0

for (( i=1; i<= numero; i++ )); 
do
	if (( numero % i == 0 ));
	then
		contar=$((contar + 1))
	fi
done

if (( contar == 2));
then
	echo "$numero é um número primo."
else	
	echo "$numero não é um número primo"
fi	 
