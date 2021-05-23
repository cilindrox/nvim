augroup eslintrc
  autocmd!
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc setf json
augroup END
