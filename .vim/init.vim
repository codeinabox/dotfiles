" Neovim configuration to extend .vimrc
source ~/.vimrc

" Shortcut to reload ~/.vim/init.vim
nnoremap <Leader>r :source ~/.vim/init.vim<CR>

" Turn off spell check in terminal
autocmd TermOpen * setlocal nospell

" Open fzf in new window
let g:fzf_layout = { 'window': 'enew' }
