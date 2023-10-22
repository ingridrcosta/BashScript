#!/bin/bash

echo "Hello Word"

echo "##################################################################"

echo "Vamos contar os número ímpares"

read -p "Digite um número ímpar: " numero

contagem=0

for (( i=1; i <= numero; i++ ));
do
	if (( i % 2 == 1 ));
	then
		contagem=$((contagem + 1))
	fi
done

echo "Existem $contagem números ímpares de 1 a $numero."
