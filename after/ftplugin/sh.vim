compiler shellcheck

augroup shellcheck
  autocmd BufWritePost <buffer> :Make
augroup END
