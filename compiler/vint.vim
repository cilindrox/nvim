if exists('current_compiler')
  finish
endif
let current_compiler = 'vint'

setlocal makeprg=vint\ --style-problem\ --no-color\ -f\ \'{file_path}:{line_number}:{column_number}:{severity}:{description}\ ({policy_name})\'\ %

setlocal errorformat+=%I%f:%l:%c:style_problem:%m,
setlocal errorformat+=%f:%l:%c:%t%*[^:]:E%n:\ %m,
setlocal errorformat+=%f:%l:%c:%t%*[^:]:%m
