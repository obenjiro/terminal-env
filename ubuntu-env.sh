#!/bin/sh
sudo apt-get update
sudo apt-get -y install curl wget vim tmux git dconf-cli htop build-essential libssl-dev

# nodejs throu nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash

# forsing nvm to appear without relogin
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# installing stable version on nodejs
nvm install stable
nvm alias default stable

# using home folder for global modules ( allows to avoid using sudo )
npm config set prefix ~/npm
export PATH="$PATH:$HOME/npm/bin"
npm install -g jshint

# getting config files and installing plugins
cd ~
rm ubuntu-env.sh
git init
git remote add origin https://github.com/aiboy/terminal-env.git
git pull origin master
git reset --hard HEAD
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# will force to reload tmux configuration
killall tmux

git config --global core.editor "vim"
# solorized color cheme for ubuntu
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
gnome-terminal-colors-solarized/set_dark.sh

# reload shell - so nvm will appear immidiatly
exec bash
