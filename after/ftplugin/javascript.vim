let b:dispatch='/Users/cx/.nvm/versions/node/v12.16.1/bin/npm t'
compiler eslint
setlocal foldmethod=syntax

augroup JS
  autocmd!
  autocmd BufWritePost <buffer> :Make
augroup END
