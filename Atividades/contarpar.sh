#!/bin/bash


echo "Hello Word"
echo "##########################################################"

echo "Vamos contar números"

read -p "Digite um número inteiro positivo: " numero

contagem=0

for (( i=0; i <= numero; i++));
do
if (( i % 2 ));
then
	contagem=$((contagem + 1 ))
fi
done

echo "Exite $contagem números pares de 1 a $numero"
