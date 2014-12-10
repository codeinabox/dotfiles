" Vundle 
set rtp+=$HOME/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

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

" Bundles
Bundle 'editorconfig/editorconfig-vim'
