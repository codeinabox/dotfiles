setlocal omnifunc=phpcomplete#CompletePHP
let php_folding = 2
setlocal foldmethod=syntax

" SuperTab {{{
function! ContextPhpUse()
  if getline('.') =~ '^use\s\+[a-zA-Z0-9_\\]*\%' . col('.') . 'c'
    return "\<c-n>"
  endif
endfunction

let b:SuperTabCompletionContexts = ['ContextPhpUse'] + g:SuperTabCompletionContexts
" }}}
