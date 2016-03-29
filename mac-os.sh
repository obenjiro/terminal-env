#!/bin/sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew install curl wget vim tmux git htop

# getting config files and installing plugins
cd ~
rm mac-os.sh
rm .vimrc
git init
git remote add origin https://github.com/aiboy/terminal-env.git
git pull origin master
git reset --hard HEAD
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# will force to reload tmux configuration ( since we kill it )
killall tmux

# install tmux plugins
~/.tmux/plugins/tpm/bin/install_plugins

git config --global core.editor "vim"
