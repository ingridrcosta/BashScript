#!/bin/bash

####################################################################

    #Crie um script Bash que solicite ao usuário que digite uma frase. 
    #Em seguida, o script deve contar o número de palavras na frase e exibir a contagem.
    

####################################################################

echo "Hello Word"
echo "####################################################################"

echo "Contagem de Palavras"

read -p "Digite uma frase: " frase


palavras=($frase);

NumeroDePalavras=${#palavras[@]}

echo "Número de palavras $NumeroDePalavras"

