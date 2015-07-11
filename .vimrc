set nocompatible              " be iMproved, required

" Plugins {{{
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'        " let Vundle manage Vundle, required
Plugin 'editorconfig/editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'kien/ctrlp.vim'
	" CtrlP {{{
	let g:ctrlp_show_hidden=1
	let g:ctrlp_max_height=10
	let g:ctrlp_custom_ignore = '\v[\/](bower_components|dist|node_modules|vendor)$'
	let g:ctrlp_extensions = ['tag', 'buffertag']
	let g:ctrlp_mruf_relative = 1
	nnoremap <Leader>t :CtrlPTag<cr>
	nnoremap <Leader>y :CtrlPBuffer<cr>
	" }}}
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'low-ghost/nerdtree-fugitive'
	" NERDTree {{{
	map <C-n> :NERDTreeToggle<CR>   " Set ctrl-n shortcut
	let NERDTreeShowHidden=1
	let NERDTreeRespectWildIgnore=1
	" }}}
Plugin 'scrooloose/syntastic'
	" Syntastic {{{
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	let g:syntastic_c_include_dirs = ["/usr/local/Cellar/pebble-sdk/3.1/Pebble/basalt/include"]
	let g:syntastic_php_phpcs_args = "--standard=PSR2"
	let g:syntastic_php_phpmd_post_args = "cleancode,codesize,design,unusedcode"
	" For CakePHP templates only use PHP checker
	autocmd BufRead,BufNewFile *.ctp let b:syntastic_checkers = ["php"]
	" }}}
Plugin 'luochen1990/rainbow'
	let g:rainbow_active = 1
Plugin 'xolox/vim-misc'       " needed by easytags
Plugin 'xolox/vim-easytags'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'Z1MM32M4N/vim-superman'
Plugin 'rkitover/vimpager'
Plugin 'tomtom/tcomment_vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'chase/vim-ansible-yaml'
Plugin 'tpope/vim-obsession'
Plugin 'elzr/vim-json'
Plugin 'sheerun/vim-polyglot'
Plugin 'ervandew/supertab'
	" SuperTab {{{
	let g:SuperTabDefaultCompletionType = "context"
	let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
	let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
	let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:<c-x><c-o>", "&completefunc:<c-x><c-u>"]
	let g:SuperTabClosePreviewOnPopupClose = 1
	" }}}
Plugin 'plasticboy/vim-markdown'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mileszs/ack.vim'
	" Ack {{{
	nnoremap <Leader>a :Ack! 
	let g:ackhighlight = 1
	let g:ack_autofold_results = 1
	" }}}
Plugin 'gregsexton/gitv'
Plugin 'voronkovich/ctrlp-symfony2.vim'
Plugin 'BufOnly.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-projectionist'
Plugin 'wincent/terminus'
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()
" }}}

" General settings {{{
" {{{ Spell check
setlocal nospell spelllang=en_gb
autocmd FileType behat,cucumber,gitcommit,markdown,text setlocal spell
map <F5> :setlocal spell!<CR>
" }}}

" Turn on line numbers
set number

" Status bar
set laststatus=2     " always show

" Bufferline
let g:bufferline_echo = 0    " don't echo to command bar

" Show tabs and trailing spaces
set list listchars=tab:\ \ ,trail:~

" Indenting
filetype plugin indent on " Enable language-dependent indenting
set tabstop=4     " The width of a tab
set shiftwidth=4  " Indent size

" Switch syntax highlighting on, when the terminal has colours
syntax on

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Highlight search matches
set hlsearch
" Ignore case in search
set ignorecase
set smartcase

" Folding
setlocal foldmethod=syntax
set foldlevelstart=1

" Autoread
set autoread

" Enable mouse support, except in vimpager
if !exists("vimpager")
set mouse=a
endif

" Use system clipboard
set clipboard+=unnamed

" No backup files
set nobackup
" No write backup
set nowritebackup
" No swap file
set noswapfile

" Shortcut to reload .vimrc
nnoremap <Leader>r :source ~/.vimrc<CR>

" Alias Wq to wq for all those times I accidentally type it
command! Wq wq

" Ignore these directories
set wildignore+=*/.git,*/.hg,*/.svn.,*/.tmp,*/.DS_Store,*/.idea,*/.project,*/.tags
" }}}

" Theme {{{
set t_Co=256	" Enable 256 colours
set background=light
try
    colorscheme hemisu
catch
    colorscheme default
endtry
" }}}

" File extensions {{{
au BufNewFile,BufRead .bowerrc set filetype=json
au BufNewFile,BufRead .jshintrc set filetype=json
au BufNewFile,BufRead .envrc set filetype=conf
" }}}

" Templates {{{
autocmd BufNewFile .editorconfig 0r $HOME/.vim/templates/editorconfig
" }}}

" Tags {{{
set tags=./.tags;,~/.vimtags
let g:easytags_dynamic_files = 2
let g:easytags_async = 1
" }}}

" Omni completion {{{
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
" }}}
