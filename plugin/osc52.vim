" Sends the default register to current terminal using OSC 52
function! Osc52Yank() abort
  let buffer=system('base64 -w0', @0)
  let buffer=substitute(buffer, "\n$", '', '')
  let buffer='\e]52;c;'.buffer.'\x07'
  silent exe '!echo -ne '.shellescape(buffer).' > '.shellescape('/dev/tty')
endfunction

command! Osc52CopyYank call Osc52Yank()

augroup clipboardOsc52
  autocmd!
  autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
augroup END
