#!/bin/bash
# =============================================
# DevOps Setup + Environment Check Script
# Author: Murilo Cardoso
# =============================================

# --- SETUP ---
echo "🔹 Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "🔹 Installing Git..."
sudo apt install git -y

echo "🔹 Configuring Git..."
git config --global user.name "Name"
git config --global user.email "mail@example.com"
git config --global init.defaultBranch main

echo "✅ Setup complete. Your environment is ready!"
USER_NAME=$(git config --global user.name)
USER_MAIL=$(git config --global user.email)
echo "Name: $USER_NAME"
echo "Email: $USER_MAIL"

# --- ENVIRONMENT CHECK ---
echo
echo "🔹 Checking operating system..."
if command -v lsb_release >/dev/null 2>&1; then
    echo "System: $(lsb_release -d | cut -f2)"
else
    echo "System information not available (lsb_release not found)."
fi

echo
echo "🔹 Checking Git installation..."
if command -v git >/dev/null 2>&1; then
    echo "Git installed: $(git --version)"
else
    echo "❌ Git not found. Install it with: sudo apt install git -y"
    exit 1
fi

echo
echo "🔹 Checking Git configuration..."
USER_NAME=$(git config user.name)
USER_EMAIL=$(git config user.email)

if [ -n "$USER_NAME" ] && [ -n "$USER_EMAIL" ]; then
    echo "✅ Git user configuration detected:"
    echo "   Name:  $USER_NAME"
    echo "   Email: $USER_EMAIL"
else
    echo "❌ Incomplete Git configuration."
    echo "   Please run the following commands:"
    echo "   git config --global user.name \"Your Name\""
    echo "   git config --global user.email \"you@example.com\""
    exit 1
fi

echo
echo "🔹 Testing SSH authentication with GitHub..."
SSH_OUTPUT=$(ssh -T git@github.com 2>&1)

if echo "$SSH_OUTPUT" | grep -q "successfully authenticated"; then
    echo "✅ SSH authentication with GitHub is working."
elif echo "$SSH_OUTPUT" | grep -q "Hi "; then
    echo "✅ SSH authentication with GitHub is working."
elif echo "$SSH_OUTPUT" | grep -q "Permission denied"; then
    echo "❌ SSH authentication failed (Permission denied)."
    echo "   Check if your public key has been added to GitHub."
else
    echo "⚠️ Unexpected SSH output:"
    echo "---------------------------------------"
    echo "$SSH_OUTPUT"
    echo "---------------------------------------"
fi

echo
echo "🎯 Environment setup and check completed successfully!"
