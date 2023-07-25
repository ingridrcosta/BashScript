 #!/bin/bash

    #Primeiro teste de script e automatizaco em bash, este script apenas
    #cria e exclui pastas no diretorio mencionado
    #pode conter alguns erros de sintaxe em bash pois, foi criado em uma semana
    #de estudos na liguagem.

 
 #identificador do diretorio
 diretorio="[seu diretorio]"



 #loop para gerar as pastas
 for ((pastas=1; pastas<=5; pastas++))
 do
     pasta=" Pack $pastas"
    
 #condicao, caso se o diretorio nao exista, sera criado as pastas
if [ ! -d "$diretorio$pasta" ]; then

       
       #Criacao das pastas
        mkdir "$diretorio$pasta"
        echo "Pasta criada $pasta"

else
 
        echo "A pasta ja existe, sobrescrevendo ou removendo..."
        rm -rf "$diretorio$pasta"
        #coloquei para remover as pastas, apenas para nao ter pastas 
        #duplicadas

fi
done
