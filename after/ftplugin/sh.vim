compiler shellcheck

augroup shellcheck
  autocmd!
  autocmd BufWritePost <buffer> :Make
augroup END
