 #!/bin/bash

    #Primeiro teste de script e automatizaco em bash, este script apenas
    #cria e exclui pastas no diretorio mencionado
    #pode conter alguns erros de sintaxe em bash pois, foi criado em uma semana
    #de estudos na liguagem.

 diretorio="[seu diretorio]"
 #pasta="Pack"


 for ((pastas=1; pastas<=5; pastas++))
 do
     pasta=" Pack $pastas"
    

if [ ! -d "$diretorio$pasta" ]; then

        mkdir "$diretorio$pasta"
        echo "Pasta criada $pasta"

else
 
        echo "A pasta ja existe, sobrescrevendo ou removendo..."
        rm -rf "$diretorio$pasta"


fi
done