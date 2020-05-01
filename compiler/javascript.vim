if exists('current_compiler')
  finish
endif
let current_compiler = 'eslint'

setlocal makeprg=eslint\ -f\ compact\ %

" https://vi.stackexchange.com/a/18849
setlocal errorformat+=%E%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m
setlocal errorformat+=%W%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m
setlocal errorformat+=%-G\\s%#,%-G%*\\d\ problem%.%#
