#!/bin/bash
sudo apt install -y \
	vim-athena \
	git \
	python3-dev \
	cmake \
	build-essential \
	mono-complete \
	golang \
	nodejs \
	default-jdk \
	npm \
	curl \
	wget
mkdir -p .ssh
git clone https://github.com/flyfeifan/Vundle.git ~/.vim/bundle/Vundle.vim
cat <<- eos > "$HOME/.vimrc"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
mkdir -p ~/.vim/colors
git clone https://github.com/ajmwagar/vim-deus.git
mv ~/vim-deus/colors/deus.vim ~/.vim/colors/
rm -rf ~/vim-deus
python3 ~/.vim/bundle/YouCompleteMe/install.py --all

