compiler eslint
let b:dispatch='npm t'

setlocal foldmethod=syntax
setlocal path+=$PWD/node_modules
setlocal isfname+=@-@
setlocal suffixesadd=.js,.json
setlocal include=require(

augroup jslint
  autocmd BufWritePost <buffer> :Make
augroup END
