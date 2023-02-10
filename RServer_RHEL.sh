#!/bin/bash
#Código simples e rápido para reiniciar os serviços do meu Servidor Red Hat Enterprise Linux (RHEL).

# Armazenar a lista de serviços em um array
services=(
  httpd
  mysql
  postgresql
  smb
  nfs
  vsftpd
)

# Loop através da lista de serviços
for service in "${services[@]}"; do
  # Verificar se o serviço está ativo
  service_status="$(systemctl is-active $service)"

  # Se o serviço estiver ativo, reiniciá-lo
  if [ "$service_status" == "active" ]; then
    systemctl restart $service
  fi
done

# Imprimir uma mensagem de sucesso
echo "Tudo certo Matheus, todos os serviços foram reiniciados com sucesso! :) "
