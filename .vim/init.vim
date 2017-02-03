" Neovim configuration to extend .vimrc
source ~/.vimrc

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Shortcut for quick terminal exit
:silent! tnoremap <Esc> <C-\><C-n>

" vim-test strategy to use Neovim terminal
let test#strategy = "neovim"
