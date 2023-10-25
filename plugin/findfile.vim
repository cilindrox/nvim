" find files and populate the quickfix list
function! FindFiles(filename)
  let error_file = tempname()
  silent exe '!find . -iname "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe 'cfile '. error_file
  copen
  call delete(error_file)
endfunction

command! -nargs=1 FindFile call FindFiles(<q-args>)
