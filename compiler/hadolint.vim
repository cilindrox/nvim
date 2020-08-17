if exists('current_compiler')
  finish
endif
let current_compiler = 'hadolint'

setlocal makeprg=hadolint\ --format\ tty\ %

CompilerSet errorformat=%f:%l\ %m
