let b:dispatch='npm t'
compiler eslint
setlocal foldmethod=syntax
setlocal path-=$PWD/node_modules

augroup jslint
  autocmd BufWritePost <buffer> :Make
augroup END
