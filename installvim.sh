#!/bin/bash
sudo apt update
sudo apt install -y \
	build-essential \
	cmake \
	curl \
	default-jdk \
	git \
	golang \
	mono-complete \
	nodejs \
	npm \
	python3-dev \
	vim-athena \
	wget
mkdir -p .ssh
git clone https://github.com/flyfeifan/Vundle.git ~/.vim/bundle/Vundle.vim
mkdir -p $HOME/.vim/colors
git clone https://github.com/ajmwagar/vim-deus.git
mv vim-deus/colors/deus.vim $HOME/.vim/colors/
rm -rf vim-deus
cat <<- eos > "$HOME/.vimrc"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" All plugins must be added before this line
call vundle#end()
filetype plugin indent on
set nu
let g:airline_theme='deus'
syntax on
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 smarttab
set fileformat=unix
set encoding=utf-8
set colorcolumn=90
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
colorscheme deus
filetype on
eos
vim +PluginInstall +qall
python3 $HOME/.vim/bundle/YouCompleteMe/install.py --all


