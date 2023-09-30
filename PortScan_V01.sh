#!/bin/bash

echo "Este script verifica o estado das portas em um endereço IP específico."
echo "Os resultados serão registrados em 'log.txt'."

# Diretório para o arquivo de log
diretorio="$HOME/Ver02"
GeradorLog="$diretorio/log.txt"

# Verifique se o diretório existe ou crie-o
if [[ ! -d $diretorio ]]; then
    mkdir -p "$diretorio"
    echo "Diretório criado: $diretorio" | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLog"
fi

# Verifique se o netcat está instalado
if ! command -v nc &>/dev/null; then
    read -p "NetCat não foi encontrado. Deseja instalar o programa? [Y/N]" instalador

    case "$instalador" in
    [Yy]*)
        sudo apt install netcat-openbsd -y
        echo "NetCat instalado." | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLog"
        ;;
    *)
        echo "NetCat não foi instalado." | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLog"
        ;;
    esac
fi

# Solicite o endereço IP ao usuário
read -p "Digite o endereço IP: " EnderecoIP

# Verifique se o formato de EnderecoIP é válido
if [[ ! $EnderecoIP =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    echo "IP inválido, verifique a digitação: $EnderecoIP" | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLog"
    exit 1
fi

# Solicite o intervalo de portas ao usuário
read -p "Digite a porta inicial (1-65535): " Porta_Inicial
read -p "Digite a porta final (1-65535): " Porta_Final

# Verifique se as portas estão no intervalo válido
if [[ ! $Porta_Inicial =~ ^[0-9]+$ || ! $Porta_Final =~ ^[0-9]+$ || \
      $Porta_Inicial -lt 1 || $Porta_Final -gt 65535 || \
      $Porta_Inicial -gt $Porta_Final ]]; then
    echo "Intervalo de portas inválido: $Porta_Inicial - $Porta_Final" | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLog"
    exit 1
fi

# Verifique o estado das portas no endereço IP
for ((Porta = Porta_Inicial; Porta <= Porta_Final; Porta++)); do
    echo "Em execução..."
    nc -zv "$EnderecoIP" "$Porta" 2>&1 | awk '{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLog"
done

echo "Verificação de portas concluída. Resultados registrados em 'log.txt'." | awk '/succeeded/{print strftime("%d/%m/%Y %H:%M"), $0 }' >> "$GeradorLog"
