set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'        " let Vundle manage Vundle, required
Plugin 'editorconfig/editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()

" Switch syntax highlighting on, when the terminal has colours
syntax on

" Turn on line numbers
set number

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Highlight search matches
set hlsearch
" Ignore case in search
set smartcase

" Theme
set background=dark
colorscheme solarized
