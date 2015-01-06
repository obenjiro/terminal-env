#!/bin/sh

sudo apt-get update
sudo apt-get -y install curl wget vim tmux git

cd ~
git init
git remote add origin https://github.com/aiboy/terminal-env.git
git pull origin master
git reset --hard HEAD
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
