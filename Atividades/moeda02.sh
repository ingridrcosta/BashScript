#!/bin/bash

moedas=(1 2 3 0 5)

for moeda in ${moedas[@]}; do
if [[ "$moeda" -ge 1 ]];
then
	echo "Moeda verdadeira $moeda"
else
	echo "Moeda falsa $moeda"
fi
done
