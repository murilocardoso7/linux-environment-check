#!/bin/bash

# ===============================================
# 🧭 Linux Environment Check
# Script de verificação e configuração inicial do ambiente Linux.
# Autor: Murilo Cardoso
# ===============================================

LOG_FILE="$HOME/environment_check.log"

# ---------- Funções utilitárias ----------
log() {
  echo -e "$1" | tee -a "$LOG_FILE"
}

check_command() {
  command -v "$1" >/dev/null 2>&1
}

ok()   { echo -e "\e[32m✅ $1\e[0m" | tee -a "$LOG_FILE"; }
info() { echo -e "\e[34m🔹 $1\e[0m" | tee -a "$LOG_FILE"; }
warn() { echo -e "\e[33m⚠️ $1\e[0m" | tee -a "$LOG_FILE"; }
fail() { echo -e "\e[31m❌ $1\e[0m" | tee -a "$LOG_FILE"; exit 1; }

# ---------- Cabeçalho ----------
echo "===============================================" | tee "$LOG_FILE"
echo "🧭 Iniciando verificação do ambiente Linux" | tee -a "$LOG_FILE"
echo "===============================================" | tee -a "$LOG_FILE"

# ---------- Verificação de dependências ----------
info "Verificando dependências básicas..."
for dep in git ssh curl; do
  if check_command "$dep"; then
    ok "$dep encontrado."
  else
    warn "$dep não encontrado. Tentando instalar..."
    sudo apt-get install -y "$dep" || fail "Falha ao instalar $dep"
  fi
done

# ---------- Atualização do sistema ----------
info "Atualizando pacotes do sistema..."
sudo apt-get update -y && sudo apt-get upgrade -y && ok "Pacotes atualizados."

# ---------- Configuração do Git ----------
if ! git config --global user.name >/dev/null; then
  info "Configurando Git global..."
  read -rp "Digite seu nome: " git_name
  read -rp "Digite seu e-mail: " git_email
  git config --global user.name "$git_name"
  git config --global user.email "$git_email"
  ok "Git configurado com sucesso."
else
  ok "Git já está configurado."
fi

# ---------- Verificação do sistema ----------
info "Verificando sistema operacional..."
OS=$(lsb_release -d | cut -f2)
ok "Sistema detectado: $OS"

# ---------- Teste SSH com GitHub ----------
info "Testando autenticação SSH com GitHub..."
ssh -T git@github.com -o StrictHostKeyChecking=no 2>&1 | tee -a "$LOG_FILE"
if [ "${PIPESTATUS[0]}" -eq 1 ]; then
  ok "Conexão SSH com GitHub verificada com sucesso."
else
  warn "Não foi possível verificar a conexão SSH."
fi

# ---------- Relatório final ----------
echo
echo "===============================================" | tee -a "$LOG_FILE"
ok "✅ Verificação concluída."
info "Log completo salvo em: $LOG_FILE"
echo "===============================================" | tee -a "$LOG_FILE"
