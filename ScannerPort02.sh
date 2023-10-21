#!/usr/bin/env bash

###########################################################################

    #Chame o Script com o bash e nome do script
    #Ex.: bash ScannerPort.sh

    #pode ser colocado parametros também como: 
    #Ex.: bash Scannerport.sh 192.168.1.1 80 443

###########################################################################



if [ "$EUID" -ne 0 ];
then
    echo "Voce precisa ser Administrador Root" 
    exit 1

fi 

if ! command -v awk &>/dev/null; then

            sudo apt-get install gawk
            echo "Nmap instalado." | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >>"$GeradorLogs"
        else    
            echo "Nmap nao foi instalado, o programa ja exite." | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >>"$GeradorLogs"
fi

if [ ! -x "$0" ]; then
    chmod +x "$0"

    if [ $? -ne 0 ]; then
          echo "Erro ao tornar o script executável" | awk ' {print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLogs"
          exit 1 
        else
            echo "Script executado com sucesso." | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLogs"       
    fi
    
fi



Diretorio="/home/lain/script_backup/ScannerPort"
GeradorLogs="/home/lain/script_backup/ScannerPort/log.txt"

if [[ ! -d $Diretorio ]];
    then 

        mkdir -p "$Diretorio" 
        mkdir -p "$(dirname "$GeradorLogs")"

        echo "Diretorio criado: $Diretorio" | awk ' {print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLogs"
    else
        echo "Diretorio Existente" "$Diretorio" | awk ' {print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLogs"    
    fi

    if ! command -v nmap &>/dev/null; then

            sudo apt install nmap
            echo "Nmap instalado." | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >>"$GeradorLogs"
        else    
            echo "Nmap nao foi instalado, o programa ja exite." | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >>"$GeradorLogs"
    
fi

 if [ $# -ne 1 ]; then
    
    exit 1
 fi  

BlocoDeIP="$1"

nmap -T4 -F "$BlocoDeIP" | tee -a "$GeradorLogs"
echo "$BlocoDeIP"
   










#Funciona
#if [[ ! $Porta_Inicial =~ ^[0-9]+$ || ! $Porta_Final =~ ^[0-9]+$ || \
#      $Porta_Inicial -lt 1 || $Porta_Final -gt 65535 || \
#      $Porta_Inicial -gt $Porta_Final ]]; then
#    exit 1
#fi


























 #IP="$1"
 #Netmask="$2"
 #Porta_Inicial="$3"
 #Porta_Final="$4"
#
#
 #for(( i=0; i<=Netmask; i++ ))
 #do  
 #   ip="${IP}${i}"
#
 #   for (( porta=Porta_Inicial; porta<=Porta_Final; porta++))
 #       do
 #           nc -zv "$ip" "$porta" 2>&1 | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLogs"
 #       done    
 #done























 #function ValidarIP() 
 #{
 #   local ip="$1"
 #   local netmask="$2"
 #   local porta_inicial="$3"
 #   local porta_final="$4"
#
 #   if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ && $netmask -ge 0 && $netmask -le 32 ]];
 #   then
 #       echo "IP $ip invalido" | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >>"$GeradorLogs"
 #       else    
 #       for((porta=porta_inicial; porta <=porta_final; porta++))
 #       do  
 #           nc -zv "$ip" "$porta" 2>&1 | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLogs"
 #       done
 #   fi        
 #   
 #}

 




















#IFS="." read -r -a partes_ip <<< "$IP"
#
#primeiro_octeto="${partes_ip[0]}"
#
#if [[ $primeiro_octeto -ge 0 && $primeiro_octeto -le 255 ]];
#then
#   for segundo_octeto in {0..255}; 
#   do
#       for terceiro_octeto in {0..255}; 
#       do
#           for quarto_octeto in {0..255};
#           do
#           IP="${primeiro_octeto}.${segundo_octeto}.${terceiro_octeto}.${quarto_octeto}"
#           ValidarIP "$IP" "$Netmask" "$Porta_Inicial" "$Porta_Final"
#           done
#       done   
#   done
#fi   














 #conexao="${partes_ip[0]}.${partes_ip[1]}.${partes_ip[2]}"
 #for i in {1..254}; do
 #   IP="$conexao.$i"
 #   ValidarIP "$IP" "$Netmask" "$Porta_Inicial" "$Porta_Final"
 #done   




































#BlocoDeIP="$1"
#Mascara="$2"
#Porta_Inicial="$2"
#Porta_Final="$3"
#
#
# function ValidarIP() 
# {
#    local ip="$1"
#    #valide=0
#    local netmask="$2"
#    local porta_inicial="$3" 
#    local porta_final="$4"  
#
#    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ && $netmask -ge 0 && $netmask -le 32 ]]; then
#
#        #VelhoIFS=$IFS
#        #IFS="."
#        #ip=($ip)
#        #IFPS=$VelhoIFS
#        #[[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
#        #    && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
#        #valide=$?
#
#
#        for ((avalie= "$porta_inicial"; avalie <= "$porta_final"; avalie++));
#         do
#            nc -zv "$ip" "$netmask" "$avalie" 2>&1 | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLogs"
#        done    
#        return 0
#        else
#        return 1
#    fi
#    #return $valide
#
#   
# }      
#
# ValidarIP "$BlocoDeIP" "$Mascara" "$Porta_Inicial" "$Porta_Final"
#
#








































###########################################################################
    #Bloco de código em funcionamento
    #porém não aplica range de IPs

#if [[ ! $BlocoDeIP =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}(/24)?$ ]];
#        then 
#            echo "IP invalido, verifique a digitacao: $BlocoDeIP" | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLogs"
#            exit 1
#fi
#
#
#if [[ ! $Porta_Inicial =~ ^[0-9]+$ || ! $Porta_Final =~ ^[0-9]+$ || \
#      $Porta_Inicial -lt 1 || $Porta_Final -gt 65535 || \
#      $Porta_Inicial -gt $Porta_Final ]]; then
#    exit 1
#fi
#
#for ((Porta = Porta_Inicial; Porta <= Porta_Final; Porta++)); do
#    nc -zv "$BlocoDeIP" "$Porta" 2>&1 | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLogs"
#done

###########################################################################





















###########################################################################

        #Estou trabalhando para avaliar um bloco de IPs inteiro
        #sendo ele de qualquer máscara
        #Mas como o Nmap é lento talvez esta parte não entre no código
        #Em fases de testes o for está em um loop no qual não lê outros IPs
        #Isso será corrigido futuramente se necessário

###########################################################################

        #LeituraNc01=$(echo "$BlocoDeIP" | cut -d '/' -f 1)   
        #LeituraNc02=$(echo "$BlocoDeIP" | cut -d '/' -f 2) 

    #for ((i=0; i <= 254; i++));
       #do 
        #Endereco_IP="$LeituraNc01.$i/$LeituraNc02"         

        #for ((avalie= "$Porta_Inicial"; avalie <= "$Porta_Final"; avalie++));
        #    do
        #    if [[ $avalie =~ ^[0-9]+$ && $avalie =~ ^[0-9]+$ && $avalie -ge 1 && $avalie -le 65535 ]];
        #     then    
        #        nc -z -v "$BlocoDeIP" "$avalie" "$avalie" >> "$GeradorLogs" 2>&1 | awk ' {print strftime("%d/%m/%Y %H:%M"), $0 }' #>> "$GeradorLogs"
        #        else
        #            echo "Portas inválidas: $avalie"
        #    fi 
        #done
    #done


###########################################################################
