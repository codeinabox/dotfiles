" Neovim configuration to extend .vimrc
source ~/.vimrc

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Shortcut to reload ~/.vim/init.vim
nnoremap <Leader>r :source ~/.vim/init.vim<CR>

" Shortcut for quick terminal exit
:silent! tnoremap <Esc> <C-\><C-n>

" Turn off spell check in terminal
autocmd TermOpen * setlocal nospell

" vim-test strategy to use Neovim terminal
let test#strategy = "neoterm"
