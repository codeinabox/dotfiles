set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'        " let Vundle manage Vundle, required
Plugin 'editorconfig/editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'       " needed by easytags
Plugin 'xolox/vim-easytags'

" All of your Plugins must be added before the following line
call vundle#end()

" Switch syntax highlighting on, when the terminal has colours
syntax on

" Turn on line numbers
set number

" Enable language-dependent indenting
filetype plugin indent on

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Highlight search matches
set hlsearch
" Ignore case in search
set smartcase

" No backup files
set nobackup
" No write backup
set nowritebackup
" No swap file
set noswapfile

" Theme
set background=dark
colorscheme solarized

" NERDTree
map <C-n> :NERDTreeToggle<CR>   " Set ctrl-n shortcut
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$','\.hg$','\.svn$','\.DS_Store$','\.idea$','\.project$']
" Automatically start if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" CtrlP
let g:ctrlp_show_hidden=1
let g:ctrlp_max_height=10

" Omni completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
