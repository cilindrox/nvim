if exists('current_compiler')
  finish
endif
let current_compiler = 'hadolint'

CompilerSet makeprg=hadolint\ --format\ tty\ %

CompilerSet errorformat=%f:%l\ %m
