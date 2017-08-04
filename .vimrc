set nocompatible              " be iMproved, required

" Plugins {{{
filetype off                  " required

" set the runtime path to include Vundle, custom snippets and initialise
set rtp+=$HOME/.vim/bundle/Vundle.vim,$HOME/.vim/snippets/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'        " let Vundle manage Vundle, required
Plugin 'editorconfig/editorconfig-vim'
Plugin 'junegunn/vim-emoji'
Plugin 'trevordmiller/nova-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'low-ghost/nerdtree-fugitive'
Plugin 'svenwin/vim-splitted-nerdtree'
	" NERDTree {{{
	" Open tree in current buffer / split
	nmap - :call splittednerdtree#revealFile()<CR>
	let NERDTreeShowHidden=1
	let NERDTreeRespectWildIgnore=1
	" }}}
Plugin 'neomake/neomake'
	" Neomake {{{
	let g:neomake_javascript_enabled_makers = ["eslint"]
	let g:neomake_jsx_enabled_makers = ["eslint"]
	" Run Neomake whenever we enter or write a buffer
	autocmd BufWritePost,BufWinEnter * silent Neomake
	" }}}
Plugin 'benjie/neomake-local-eslint.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'tomtom/tcomment_vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
	" Tagbar {{{
	nmap <Leader>tbt :TagbarToggle<CR>
	nmap <Leader>tbp :TagbarTogglePause<CR>
	let g:tagbar_type_ansible = {
		\ 'ctagstype' : 'ansible',
		\ 'kinds' : [
			\ 't:tasks'
		\ ],
		\ 'sort' : 0
	\ }
	let g:tagbar_type_make = {
		\ 'kinds':[
			\ 'm:macros',
			\ 't:targets'
		\ ]
	\}
	let g:tagbar_type_markdown = {
		\ 'ctagstype' : 'markdown',
		\ 'kinds' : [
			\ 'h:Heading_L1',
			\ 'i:Heading_L2',
			\ 'k:Heading_L3'
		\ ]
	\ }
	" }}}
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'tpope/vim-surround'
Plugin 'chase/vim-ansible-yaml'
Plugin 'sheerun/vim-polyglot'
	let g:jsx_ext_required = 1
	let g:javascript_plugin_jsdoc = 1
Plugin 'ap/vim-css-color'
Plugin 'ervandew/supertab'
	" SuperTab {{{
	let g:SuperTabDefaultCompletionType = "context"
	let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
	let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
	let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:<c-x><c-o>", "&completefunc:<c-x><c-u>"]
	let g:SuperTabClosePreviewOnPopupClose = 1
	" Fall back to keyword completion if omnifunc not set
	autocmd FileType * 
		\if &omnifunc == '' |
		\let b:SuperTabContextDefaultCompletionType = "<c-n>"|
		\endif
	" }}}
Plugin 'lvht/phpcd.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mileszs/ack.vim'
	" Ack {{{
	nnoremap <Leader>a :Ack! 
	let g:ackhighlight = 1
	let g:ack_autofold_results = 1
	" }}}
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
	" fzf {{{
	let g:fzf_layout = { 'down': '~20%' }
	nnoremap <c-p> :Files<cr>
	nnoremap <Leader>y :Buffers<cr>
	" }}}
Plugin 'BufOnly.vim'
Plugin 'fatih/vim-go'
	let g:go_fmt_command = "goimports"
Plugin 'tpope/vim-projectionist'
	" vim-projectionist {{{
	let g:projectionist_heuristics = {
		\   "README.md": {
		\     "README.md": {"type": "doc"},
		\   },
		\   ".editorconfig": {
		\     ".editorconfig": {"type": "ec"},
		\   },
		\   "composer.json": {
		\     "composer.json": {"type": "pkg"},
		\     "src/*.php": {"type": "src"},
		\     "spec/*Spec.php": {"type": "spec", "alternate": "src/{}.php"},
		\     "tests/*Test.php": {"type": "test", "alternate": "src/{}.php"}
		\   },
		\   "package.json": {
		\     "package.json": {"type": "pkg"},
		\     "src/*.js": {"type": "src", "alternate": "tests/{}-test.js"},
		\     "tests/*-test.js": {"type": "test", "alternate": "src/{}.js"},
		\     "src/*.jsx": {"type": "src", "alternate": "tests/{}-test.jsx"},
		\     "tests/*-test.jsx": {"type": "test", "alternate": "src/{}.jsx"}
		\   },
		\   "*.go": {
		\     "*.go": {"type": "src", "alternate": "{}_test.go"},
		\     "*_test.go": {"type": "test", "alternate": "{}.go"}
		\   },
		\   "ansible/": {
		\     "ansible/playbook.yml": {"type": "playbook"},
		\     "ansible/roles/*/defaults/main.yml": {"type": "defaults", "alternate": "ansible/roles/{}/tasks/main.yml"},
		\     "ansible/roles/*/tasks/main.yml": {"type": "task", "alternate": "ansible/roles/{}/defaults/main.yml"}
		\   }
		\ }
	" }}}
Plugin 'heavenshell/vim-jsdoc'
	" vim-jsdoc {{{
	let g:jsdoc_allow_input_prompt = 1
	let g:jsdoc_enable_es6 = 1
	" }}}
Plugin 'benmills/vimux'
Plugin 'janko-m/vim-test'
	" vim-test {{{
	let g:test#runner_commands = ['Behat', 'PHPSpec', 'PHPUnit']
	let test#php#phpspec#options = '--no-code-generation'
	let test#php#phpunit#options = '--no-coverage'
	let test#strategy = "vimux"
	nnoremap <Leader>tf :TestFile<cr>
	nnoremap <Leader>tl :TestLast<cr>
	nnoremap <Leader>tn :TestNearest<cr>
	nnoremap <Leader>ts :TestSuite<cr>
	nnoremap <Leader>tv :TestVisit<cr>
	" }}}
Plugin 'mtth/scratch.vim'
Plugin 'SirVer/ultisnips'
	" UltiSnips {{{
	let g:snips_author=$AUTHOR
	let g:UltiSnipsListSnippets="<c-d>"
	autocmd BufRead,BufNewFile,BufEnter *Spec.php UltiSnipsAddFiletypes php-phpspec
	" }}}
Plugin 'honza/vim-snippets'
Plugin 'kylef/apiblueprint.vim'
Plugin 'matze/vim-move'
	let g:move_key_modifier = 'C'
Plugin 'junegunn/vader.vim'
" Neovim specific plugins {{{
if has('nvim')
	Plugin 'Shougo/deoplete.nvim'
		let g:deoplete#enable_at_startup = 1
	Plugin 'carlitux/deoplete-ternjs'
	Plugin 'Shougo/neco-vim'
	Plugin 'kassio/neoterm'
		let g:neoterm_size = 10
		let g:neoterm_autoscroll = 1
endif
" }}}

" All of your Plugins must be added before the following line
call vundle#end()
" }}}

" General settings {{{
" {{{ Spell check
set spell spelllang=en_gb spellfile=~/.vim/spell/en.utf-8.add
" Turn off spelling for certain syntaxes or if no syntax
autocmd BufEnter,BufNewFile * if &syntax == "" | setlocal nospell | endif
autocmd FileType apache,conf,dosini,gitconfig,gitrebase,json,nerdtree,yaml setlocal nospell
map <F5> :setlocal spell!<CR>
" Auto-complete with dictionary words when spell check is on
set complete+=kspell
" }}}

" Turn on line numbers
set number

" Status bar
set laststatus=2     " always show

" Always draw the sign column
set signcolumn=yes

" Bufferline
let g:bufferline_echo = 0    " don't echo to command bar

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

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
" Show where search pattern typed so far matches
set incsearch

" Folding
set foldmethod=syntax
autocmd FileType ansible,conf,sh,tmux,zsh,vim setlocal foldmethod=marker
set foldlevelstart=7

" Auto read and write
set autoread
set autowrite

" Enable mouse support
set mouse=a

" Use system clipboard
set clipboard+=unnamed

" Redraw only when we need to
set lazyredraw

" No backup files
set nobackup
" No write backup
set nowritebackup
" No swap file
set noswapfile

" Shortcut to reload .vimrc
nnoremap <Leader>r :source ~/.vimrc<CR>

" Splits based on Tmux keys
nnoremap <Leader>" :split<CR>
nnoremap <Leader>% :vsplit<CR>

nnoremap <Leader>w :update<CR>

" Alias Wq to wq for all those times I accidentally type it
command! Wq wq

" Ignore these files and directories
set wildignore+=*/.git,*/.hg,*/.svn,*/.tmp,*/.DS_Store,*/.tags
set wildignore+=*.phar,*.o,*.obj,*.exe,*.dll,*.manifest " compiled and binary files
set wildignore+=*/.idea,*/.project,*/nbproject,*/.tern-port " other IDEs
set wildignore+=*/app/cache,*/.sass-cache " project caches
" }}}

" Theme {{{
set t_Co=256	" Enable 256 colours
" Use VIM_BACKGROUND to set if it's dark or light
if !empty($VIM_BACKGROUND)
	let &background=$VIM_BACKGROUND
else
	set background=dark
endif
try
    colorscheme nova
catch
    colorscheme default
endtry
" }}}

" GUI options {{{
if has("gui_running")
	set guifont=Fira\ Mono:h12
endif
" }}}

" File extensions {{{
au BufNewFile,BufRead *.ctp setlocal filetype=html.php
au BufNewFile,BufRead *.hbt setlocal filetype=html.handlebars
au BufNewFile,BufRead .bowerrc setlocal filetype=json
au BufNewFile,BufRead .jshintrc setlocal filetype=json
au BufNewFile,BufRead .eslintrc setlocal filetype=json
au BufNewFile,BufRead .envrc setlocal filetype=conf
au BufNewFile,BufRead composer.lock setlocal filetype=json
au BufNewFile,BufRead .git-authors setlocal filetype=yaml
" }}}

" Templates {{{
autocmd BufNewFile .editorconfig 0r $HOME/.vim/templates/editorconfig
" }}}

" Tags {{{
set tags=./.tags;,~/.vimtags
" }}}

" Omni completion {{{
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#Complete
" }}}

" Emoji {{{
if has('mac') && !has('nvim')
	" Git gutter
	let g:gitgutter_sign_added = emoji#for('hatching_chick')
	let g:gitgutter_sign_modified = emoji#for('mushroom')
	let g:gitgutter_sign_removed = emoji#for('skull')
	let g:gitgutter_sign_modified_removed = emoji#for('cloud')
	" NERDTree Git
	let g:NERDTreeIndicatorMapCustom = {
		\ "Modified"  : emoji#for('mushroom'),
		\ "Staged"    : emoji#for('outbox_tray'),
		\ "Untracked" : emoji#for('alien'),
		\ "Renamed"   : emoji#for('arrow_forward'),
		\ "Unmerged"  : emoji#for('stuck_out_tongue'),
		\ "Deleted"   : emoji#for('skull'),
		\ "Dirty"     : emoji#for('cloud'),
		\ "Clean"     : emoji#for('sunny'),
		\ "Unknown"   : emoji#for('fearful')
		\ }
endif
" }}}
