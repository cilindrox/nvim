compiler yaml

setlocal tabstop=2 sts=2 sw=2 expandtab
setlocal foldmethod=syntax
" setlocal iskeyword+=-

augroup yamllint
  autocmd BufWritePost <buffer> :Make
augroup END
