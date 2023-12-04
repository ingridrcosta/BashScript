#!/usr/bin/env bash

###########################################################################

    #Na primeira execucao chame o Script como bash e nome do script
    #Ex.: bash ScannerPort.sh

    #pode ser colocado parametros tambem como: 
    #Ex.: bash Scannerport.sh 192.168.1.1 40 80

###########################################################################


#if [ ! -x "$0" ]; then
#        chmod +x "$0"
#
#        if [ $? -ne 0 ]; then
#                echo "Erro ao tornar o script executavel" | awk ' {print strftime("%d/%m/%Y %H:%M"), $0 }' > "$GeradorLogsNC"
#                exit 1 
#        else
#                echo "Script executado com sucesso." | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' > "$GeradorLogsNC"       
#        fi
#fi


Diretorio="/home/lain/PUC/NetCatScanner/scan/" 
GeradorLogsNC="/home/lain/PUC/NetCatScanner/scan/log.txt"

exec 3>&1 4>&2 # Save stdout and stderr
exec > "$GeradorLogsNC" 2>&1 # Redirect output to the log file

# Add debugging output
echo "Starting script at $(date)" >&3


if [[ ! -d $Diretorio ]];then
        mkdir -p "$Diretorio"
        mkdir -p "$(dirname "$GeradorLogsNC")"
        echo "Diretorio criado: $Diretorio" | awk ' {print strftime("%d/%m/%Y %H:%M"), $0 }' > "$GeradorLogsNC"
    else   
        echo "Diretorio Existente" "$Diretorio" | awk ' {print strftime("%d/%m/%Y %H:%M"), $0 }' > "$GeradorLogsNC"    


fi

if ! command -v nc &>>/dev/null; then

        sudo apt install netcat-openbsd -y
        echo "NetCat instalado." | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' > "$GeradorLogsNC"

fi
if [ $# -eq 0 ]; then
        echo " Insira Bloco IP /24 +  Range de portas validos!"| awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' > "$GeradorLogsNC"
        exit 1
fi 

BlocoDeIP="$1"
Mascara="$2"
Porta_Inicial="$3"
Porta_Final="$4"

# Ajuste na definição de ip_saida para extrair corretamente o IP base
ip_saida=$(echo "$BlocoDeIP" | awk -F'/' '{print $1}')

#function validarBlocoIP() {
#    local bloco_ip=$1
#
#    # Extrair IP e máscara usando awk
#    local ip=$(echo "$bloco_ip" | awk -F'/' '{print $1}')
#    local mascara=$(echo "$bloco_ip" | awk -F'/' '{print $2}')
#
#    # Validar o formato do IP e da máscara
#    if [[ ! $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ || ! $mascara =~ ^[0-9]{1,2}$ || $mascara -lt 1 || $mascara -gt 32 ]]; then
#        return 1  # Bloco IP inválido
#    fi
#
#    return 0  # Bloco IP válido
#}

for octeto in $(seq 1 254); do
    for Mascara in $(seq $Mascara 32); do
        bloco_ip="$ip_saida.$octeto/$mascara"

        # Validar o bloco de IP e a máscara
        if ! validarBlocoIP "$bloco_ip"; then
            echo "Bloco IP inválido: $bloco_ip (exemplo: 192.168.1.1/24)" > "$GeradorLogsNC"
            exit 1
        fi

        for port in $(seq $Porta_Inicial $Porta_Final); do
            nc -zv "$ip_saida.$octeto" "$port" 2>&1 | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' > "$GeradorLogsNC"
        done
    done
done
# ... (outras partes do seu script)


# ... (outras partes do seu script)

exec 1>&3 2>&4 # Restore stdout and stderr


#for ((Porta= $port_inicial; Porta <= $port_final; Porta++)); do
#        nc -zv "$bloco_ip" "$Porta" 2>&1 | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' > "$GeradorLogsNC"
#done




               # nc -zv "$bloco_ip" "$port" 2>&1 | awk '/succeeded/{print strftime("%d/%m/%Y %H:%M"),$3,$4,$5,$6}' > "$GeradorLogsNC"
