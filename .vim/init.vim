" Neovim configuration to extend .vimrc
source ~/.vimrc


" Disable Python 2 provider and set path for Python 3
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'

" Shortcut to reload ~/.vim/init.vim
nnoremap <Leader>r :source ~/.vim/init.vim<CR>

" Turn off spell check in terminal
autocmd TermOpen * setlocal nospell
