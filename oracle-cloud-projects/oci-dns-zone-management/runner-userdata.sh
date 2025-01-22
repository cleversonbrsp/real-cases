#!/bin/bash

# Atualizar pacotes e instalar o servidor Apache
echo "Instalando o servidor Apache..."
sudo yum install httpd -y

# Iniciar o serviço Apache
echo "Iniciando o Apache..."
sudo apachectl start

# Habilitar o serviço Apache para iniciar automaticamente no boot
echo "Habilitando Apache no boot..."
sudo systemctl enable httpd

# Testar a configuração do Apache
echo "Testando a configuração do Apache..."
sudo apachectl configtest
if [ $? -eq 0 ]; then
    echo "Configuração do Apache: Syntax OK"
else
    echo "Erro na configuração do Apache. Corrija antes de prosseguir."
    exit 1
fi

# Criar regra de firewall para permitir acesso HTTP
echo "Configurando regras de firewall..."
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --reload
if [ $? -eq 0 ]; then
    echo "Regras de firewall configuradas com sucesso!"
else
    echo "Erro ao configurar regras de firewall. Verifique manualmente."
    exit 1
fi

# Criar um arquivo index.html com mensagem personalizada
echo "Criando página inicial personalizada..."
sudo bash -c 'echo RODRIGUES DEVOPS > /var/www/html/index.html'

# Reiniciar o serviço Apache para aplicar mudanças
echo "Reiniciando o Apache..."
sudo apachectl restart
if [ $? -eq 0 ]; then
    echo "Servidor web configurado e em execução!"
else
    echo "Erro ao reiniciar o Apache. Verifique a configuração."
    exit 1
fi

echo "Configuração do servidor web concluída com sucesso!"
