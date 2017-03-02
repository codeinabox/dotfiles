" Neovim configuration to extend .vimrc
source ~/.vimrc

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set termguicolors

" Shortcut to reload ~/.vim/init.vim
nnoremap <Leader>r :source ~/.vim/init.vim<CR>

" Shortcut for quick terminal exit
:silent! tnoremap <Esc> <C-\><C-n>

" vim-test strategy to use Neovim terminal
let test#strategy = "neoterm"
