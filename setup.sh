set -uo

# Install oh my zsh 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zsh-completions 
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
# zsh syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Set ZSH_THEME="powerlevel10k/powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Vim plug
curl -FLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Neovim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install docker
brew install --cask docker
brew install asdf 

# Add plugins
cut -d' ' -f1 asdf/.tool-versions|xargs -I{} asdf plugin add {}
asdf install

sh ./git/setup.sh

#Symlink files
ln -s -f ${PWD}/zsh/.zshrc ~/.zshrc
ln -s -f ${PWD}/asdf/.tool-versions ~/.tool-versions
ln -s -f ${PWD}/git/.gitignore_global ~/.gitignore_global


gh config set editor nvim
