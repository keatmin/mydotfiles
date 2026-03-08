#!/bin/bash
set -uo

# Update package list
sudo apt update

# Install Kitty terminal emulator
sudo apt install -y kitty
sudo apt install -y git curl

# Install Starship
curl -sS https://starship.rs/install.sh | sh

# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Add plugins
cut -d' ' -f1 asdf/.tool-versions|xargs -I{} asdf plugin add {}
asdf install

# Git setup
sh ./git/setup.sh

ln -s -f ${PWD}/asdf/.tool-versions ~/.tool-versions
ln -s -f ${PWD}/git/.gitignore_global ~/.gitignore_global

gh config set editor nvim
sh ./precommit/setup.sh
