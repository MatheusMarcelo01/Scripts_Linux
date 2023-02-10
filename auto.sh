#!/bin/bash

#Script para atualizar automaticamente meus pacotes no Kubuntu

# Atualizar o índice de pacotes
sudo apt-get update

# Atualizar todos os pacotes instalados
sudo apt-get upgrade -y

# Imprimir uma mensagem de sucesso
echo "Atualização concluída com sucesso!"



#-> No terminal conceder permissão de execução com: chmod +x auto.sh
#Logo, executar: ./auto.sh
