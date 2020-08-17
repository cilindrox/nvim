if exists('current_compiler')
  finish
endif
let current_compiler = 'terraform'

CompilerSet makeprg=terraform\ fmt\ -check=true\ -diff\ -write=false\ %
