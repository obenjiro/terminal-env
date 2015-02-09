#!/bin/sh
sudo apt-get update
sudo apt-get -y install curl wget vim tmux git dconf-cli nodejs-legacy npm htop

npm config set prefix ~/npm
export PATH="$PATH:$HOME/npm/bin"
npm install -g jshint

# getting config files and installing plugins
cd ~
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
