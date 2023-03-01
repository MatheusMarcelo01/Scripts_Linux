##Antes de executar o script, dar permissões a ele usando no terminal o comando:
#chmod +x LibreOffice_MyPC.sh

#Depois só executar:
#./LibreOffice_MyPC.sh



import subprocess
import time

# Instala o xdotool caso ele ainda não esteja instalado - ferramente que simula teclas do teclado para executar funções.
try:
    subprocess.check_call(['xdotool', 'version'])
except subprocess.CalledProcessError:
    subprocess.check_call(['sudo', 'apt', 'install', '-y', 'xdotool'])

# Abre o LibreOffice
subprocess.Popen(['libreoffice'])

# Aguarda 5 segundos para o LibreOffice abrir completamente
time.sleep(5)

# Clica em Ferramentas > Opções
subprocess.call(['xdotool', 'key', 'alt+t'])
subprocess.call(['xdotool', 'key', 'o'])

# Aguarda 1 segundo para que a janela de Opções seja carregada
time.sleep(1)

# Seleciona a área LibreOffice e clica em Avançado
subprocess.call(['xdotool', 'key', 'alt+l'])
subprocess.call(['xdotool', 'key', 'a'])

# Aguarda 1 segundo para que a página de Avançado seja carregada
time.sleep(1)

# Marca a opção "Ativar Funcionalidades Experimentais"
subprocess.call(['xdotool', 'key', 'tab'])
subprocess.call(['xdotool', 'key', 'space'])

# Clica no botão "OK"
subprocess.call(['xdotool', 'key', 'alt+o'])

# Aguarda 1 segundo para que o LibreOffice reinicie
time.sleep(1)

# Clica em Exibir > Leiaute de Barra de Ferramentas > Barra de Abas
subprocess.call(['xdotool', 'key', 'alt+v'])
subprocess.call(['xdotool', 'key', 'b'])
subprocess.call(['xdotool', 'key', 'tab'])
subprocess.call(['xdotool', 'key', 'tab'])
subprocess.call(['xdotool', 'key', 'space'])

# Fecha o LibreOffice
subprocess.call(['xdotool', 'key', 'ctrl+q'])

