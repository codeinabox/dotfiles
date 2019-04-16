set nocompatible              " be iMproved, required

set exrc                      " allow project .vimrc

" Plugins {{{
" automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-emoji'
Plug 'gilgigilgil/anderson.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'low-ghost/nerdtree-fugitive'
Plug 'svenwin/vim-splitted-nerdtree'
	" NERDTree {{{
	" Open tree in current buffer / split
	nmap - :call splittednerdtree#revealFile()<CR>
	let NERDTreeShowHidden=1
	let NERDTreeRespectWildIgnore=1
	" }}}
Plug 'neomake/neomake'
	" Neomake {{{
	let g:neomake_javascript_enabled_makers = ["eslint", "jshint"]
	let g:neomake_jsx_enabled_makers = ["eslint"]
	" Run Neomake whenever we enter or write a buffer
	autocmd BufWritePost,BufWinEnter * silent Neomake
	" }}}
Plug 'benjie/neomake-local-eslint.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
	" Lightline {{{
	let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
	\   'right': [ [ 'lineinfo' ],
	\              [ 'percent' ],
	\              [ 'filetype' ],
	\              [ 'neomake' ] ],
	\ },
	\ 'component_function': {
	\   'gitbranch': 'fugitive#head'
	\ },
	\ 'component_expand': {
	\   'neomake': 'LightlineNeomake'
	\ },
	\ 'component_type': {
	\   'neomake': 'error'
	\ }
	\}

	function LightlineNeomake()
		return '%{neomake#statusline#LoclistStatus()}'
	endfunction
	" }}}
Plug 'tomtom/tcomment_vim'
Plug 'ludovicchabant/vim-gutentags'
	let g:gutentags_ctags_tagfile = '.tags'
Plug 'majutsushi/tagbar'
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
Plug 'vim-php/tagbar-phpctags.vim', { 'do': 'brew install phpctags' }
Plug 'tpope/vim-surround'
Plug 'chase/vim-ansible-yaml'
Plug 'sheerun/vim-polyglot'
	let g:jsx_ext_required = 1
	let g:javascript_plugin_jsdoc = 1
Plug 'ap/vim-css-color'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'sbdchd/neoformat'
	let g:neoformat_run_all_formatters = 1
	nnoremap <Leader>nf :Neoformat<cr>
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
	" Ack {{{
	nnoremap <Leader>a :Ack! 
	let g:ackhighlight = 1
	let g:ack_autofold_results = 1
	" }}}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
	" fzf {{{
	let g:fzf_layout = { 'down': '~20%' }
	nnoremap <c-p> :Files<cr>
	nnoremap <Leader>y :Buffers<cr>
	" }}}
Plug 'vim-scripts/BufOnly.vim'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
	let g:go_fmt_command = "goimports"
	let g:go_highlight_types = 1
Plug 'tpope/vim-projectionist'
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
Plug 'heavenshell/vim-jsdoc'
	" vim-jsdoc {{{
	let g:jsdoc_allow_input_prompt = 1
	let g:jsdoc_enable_es6 = 1
	" }}}
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'
	" vim-test {{{
	let g:test#runner_commands = ['Behat', 'PHPSpec', 'PHPUnit']
	let test#php#phpspec#options = '--no-code-generation'
	let test#php#phpunit#options = '--no-coverage'
	let test#strategy = "neoterm"
	nnoremap <Leader>tf :TestFile<cr>
	nnoremap <Leader>tl :TestLast<cr>
	nnoremap <Leader>tn :TestNearest<cr>
	nnoremap <Leader>ts :TestSuite<cr>
	nnoremap <Leader>tv :TestVisit<cr>
	" }}}
Plug 'mtth/scratch.vim'
Plug 'SirVer/ultisnips'
	" UltiSnips {{{
	let g:snips_author=$AUTHOR
	let g:UltiSnipsListSnippets="<c-d>"
	autocmd BufRead,BufNewFile,BufEnter *Spec.php UltiSnipsAddFiletypes php-phpspec
	" }}}
Plug 'honza/vim-snippets'
Plug 'kylef/apiblueprint.vim'
Plug 'matze/vim-move'
	let g:move_key_modifier = 'C'
Plug 'junegunn/vader.vim'
Plug 'Shougo/echodoc.vim'
	let g:echodoc_enable_at_startup = 1
Plug 'kassio/neoterm'
	" Neoterm {{{
	let g:neoterm_size = 16
	let g:neoterm_autoscroll = 1
	let g:neoterm_default_mod = 'belowright'
	" }}}
" Neovim specific plugins {{{
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
		let g:deoplete#enable_at_startup = 1
	Plug 'autozimu/LanguageClient-neovim', {
		\ 'branch': 'next',
		\ 'do': 'bash install.sh',
		\ }
	let g:LanguageClient_serverCommands = {
		\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
		\ 'typescript': ['/usr/local/bin/javascript-typescript-stdio']
		\ }
	Plug 'Shougo/neco-vim'
	Plug 'deathlyfrantic/deoplete-spell'
	Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}
endif
" }}}

" All of your Plugins must be added before the following line
call plug#end()
" }}}

" General settings {{{
" set the runtime path to custom snippets
set rtp+=$HOME/.vim/snippets/

" {{{ Spell check
set spell spelllang=en_gb spellfile=~/.vim/spell/en.utf-8.add
" Turn off spelling for certain syntaxes or if no syntax
autocmd BufEnter,BufNewFile * if &syntax == "" | setlocal nospell | endif
autocmd FileType apache,conf,dosini,fzf,gitconfig,gitrebase,json,neoterm,nerdtree,yaml setlocal nospell
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

" Don't show mode
set noshowmode

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

" Split behaviour
set splitbelow

" Shortcut to reload .vimrc
nnoremap <Leader>r :source ~/.vimrc<CR>

" Splits based on Tmux keys
nnoremap <Leader>" :split<CR>
nnoremap <Leader>% :vsplit<CR>

nnoremap <Leader>w :update<CR>

" Shortcut for quick terminal exit
:silent! tnoremap <Esc> <C-\><C-n>

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
set background=dark
try
    colorscheme anderson
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

" Completion {{{
" Turn off complete option preview
set completeopt-=preview

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#Complete
" }}}

" Emoji {{{
if has('mac')
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

" prevent :autocmd, shell and write commands from inside project-specific .vimrc
set secure
