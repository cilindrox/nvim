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
  call minpac#add('hashivim/vim-terraform')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('mustache/vim-mustache-handlebars')
  call minpac#add('nelstrom/vim-visual-star-search')
  call minpac#add('nginx/nginx', {'subdir': 'contrib/vim'})
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
  call minpac#add('tpope/vim-rhubarb')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('vim-scripts/ReplaceWithRegister')

endfunction

command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus source $MYVIMRC | call PackInit() | call minpac#status()
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()

" Plugin config {{{
let g:ctrlp_extensions        = ['buffertag']
let g:ctrlp_reuse_window      = 'netrw'
let g:ctrlp_switch_buffer     = 'et'
let g:ctrlp_types             = ['buf', 'fil']
let g:ctrlp_use_caching       = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_buftag_types = {
  \'terraform' : '--languages=+Terraform'
  \}

let g:UltiSnipsJumpForwardTrigger  = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:go_addtags_transform           = 'camelcase'
" let g:go_def_mode    = 'gopls'
" let g:go_info_mode   = 'gopls'"
" let g:go_fmt_command = 'gopls'
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave         = 1

let g:rustfmt_autosave = 1
" }}}
