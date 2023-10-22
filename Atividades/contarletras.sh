#!/bin/bash

####################################################################

    #Crie um script Bash que solicite ao usuário que digite uma frase. 
    #Em seguida, o script deve contar o número de letras na frase e exibir a contagem.
    

####################################################################

echo "Hello Word"

echo "####################################################################"

echo "Contador de Letras"


echo "Digite uma frase: "
read frase

contador=1


#Usei a versão em While

while [[ ${#frase} -gt contador ]];
do 
    echo "Aqui tem: $contador palavrinhas" 
    contador=$((contador+1))
done

echo "A quantidade de letras na frase são: $contador"







#Versão em for

#contador=1
#for (( i=0; i<${#frase}; i++));
#do
#    echo "Aqui tem: $contador palavrinhas"  #Devido um bug engraçado, deixei esse echo (sei que não deveria ;p)
#    contador=$((contador + 1))
#   
#done    
# echo "A quantidade de letras na frase são: $contador"