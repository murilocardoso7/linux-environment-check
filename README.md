🧭 Linux Environment Check

Script em Bash criado para automatizar a configuração inicial e a checagem básica de um ambiente Linux.
Ele atualiza o sistema, instala dependências, configura o Git e testa a conexão SSH com o GitHub, ajudando a garantir que o ambiente esteja pronto para uso técnico.

O foco é praticidade e padronização, especialmente útil para quem está montando um ambiente de estudos, trabalho remoto ou iniciando em DevOps.

⚙️ Funcionalidades

Atualiza pacotes do sistema operacional

Verifica e instala dependências essenciais (git, ssh, curl)

Configura o Git globalmente (nome e e-mail)

Exibe a versão do sistema operacional

Testa a autenticação SSH com o GitHub

Exibe mensagens coloridas de diagnóstico

Salva o log completo da execução (~/environment_check.log)

🧾 Exemplo de saída
===============================================
🧭 Iniciando verificação do ambiente Linux
===============================================

🔹 Verificando dependências básicas...
✅ git encontrado.
✅ ssh encontrado.
✅ curl encontrado.

🔹 Atualizando pacotes do sistema...
✅ Pacotes atualizados.

🔹 Configurando Git global...
✅ Git configurado com sucesso.

🔹 Verificando sistema operacional...
✅ Sistema detectado: Ubuntu 24.04 LTS

🔹 Testando autenticação SSH com GitHub...
✅ Conexão SSH com GitHub verificada com sucesso.

===============================================
✅ Verificação concluída.
🔹 Log completo salvo em: /home/usuario/environment_check.log
===============================================

💾 Como usar
# 1. Baixe o script
git clone https://github.com/seuusuario/linux-environment-check.git
cd linux-environment-check

# 2. Dê permissão de execução
chmod +x environment_check.sh

# 3. Execute
./environment_check.sh


O script solicitará o nome e o e-mail do Git apenas se ainda não estiverem configurados globalmente.
