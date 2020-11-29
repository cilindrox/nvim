function! PackInit() abort
  packadd minpac

  if !exists('g:loaded_minpac')
    return
  endif

  call minpac#init({'progress_open': 'none'})
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('SirVer/ultisnips')
  call minpac#add('chriskempson/base16-vim')
  call minpac#add('ctrlpvim/ctrlp.vim')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('elzr/vim-json')
  call minpac#add('fatih/vim-go')
  call minpac#add('google/vim-jsonnet')
  call minpac#add('hashivim/vim-terraform')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('mustache/vim-mustache-handlebars')
  call minpac#add('nelstrom/vim-visual-star-search')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('plasticboy/vim-markdown')
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-projectionist')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('vim-scripts/ReplaceWithRegister')

endfunction

command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus source $MYVIMRC | call PackInit() | call minpac#status()
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
