#!/bin/sh
sudo apt-get update
sudo apt-get -y install curl wget vim tmux git dconf-cli htop build-essential libssl-dev gconf2 gnome-terminal

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
rm .vimrc
git init
git remote add origin https://github.com/aiboy/terminal-env.git
git pull origin master
git reset --hard HEAD
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# will force to reload tmux configuration
killall tmux

# zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo "plugins=(git colorize sublime web-search nvm z alias-tips)" >> ~/.zshrc
echo "ZSH_THEME=\"miloshadzic\"" >> ~/.zshrc


# git configuration
git config --global core.editor "vim"

# solorized color cheme for ubuntu
wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
mv dircolors.ansi-dark .dircolors
eval `dircolors ~/.dircolors`

git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized; mv * ../
cd ~; ./set_dark.sh

# reload shell - so nvm will appear immidiatly
exec bash
