source ~/.config/nvim/packages.vim

" Configuration {
  set showmatch        " Show matching brackets.
  set number           " Show the line numbers on the left side.
  set relativenumber   " Hybrid line numbering
  set cursorline       " Highlight the current line
  set numberwidth=5
  set formatoptions+=o " Continue comment marker in new lines.

  " Soft tabs, 2 spaces by default
  set expandtab
  set tabstop=2
  set shiftwidth=2
  set shiftround

  " When the type of shell script is /bin/sh, assume a POSIX-compatible
  " shell for syntax highlighting purposes.
  let g:is_posix = 1

  "netrw use tree style, disable banner
  let g:netrw_altv=1
  let g:netrw_banner=0
  let g:netrw_browse_split=4
  let g:netrw_liststyle=3
  let g:netrw_winsize=25

  " Display extra whitespace
  set list listchars=tab:»·,trail:·,nbsp:·,eol:¬

  " Make it obvious where 80 characters is
  set textwidth=80
  set colorcolumn=+1

  set noerrorbells        " No beeps.
  set modeline            " Enable modeline.
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

  set linespace=0         " Set line-spacing to minimum.

  set autochdir           " Switch to current file's parent directory.
  set autowrite           " Automatically save before :next, :make etc.
  set hidden
  set noshowmode          " Disable default mode indicator

  " Remove special characters for filename
  set isfname-=:
  set isfname-==
  set isfname-=+

  " More natural splits
  set splitbelow          " Horizontal split below current.
  set splitright          " Vertical split to right of current.

  if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
  endif
  if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
  endif

  set nostartofline       " Do not jump to first character with page commands.

  set nojoinspaces        " Don't add extra space after ., !, etc. when joining

  set foldmethod=indent   "fold based on indent
  set foldnestmax=3       "deepest fold is 3 levels
  set nofoldenable        "dont fold by default

  set showmatch           " Highlights matching parentheses
  set ignorecase          " Ignores case when searching
  set smartcase           " Unless you put some caps in your search term
  set fileignorecase
  set wildignorecase
  set gdefault            " Use 'g' flag by default with :s/foo/bar/.
  set magic               " Use 'magic' patterns (extended regular expressions).
  set wildmode=longest:full,full

  " Always use vertical diffs
  set diffopt+=vertical

  " Undo history
  set undofile
  set undodir=$HOME/.config/nvim/undo
  " Disable undo for temp and sensitive files
  augroup vimrc
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
  augroup END
" }

augroup vimrcIni
  autocmd!

  au BufLeave,FocusLost,InsertEnter * :set norelativenumber
  au BufEnter,FocusGained,InsertLeave * :set relativenumber number

  " Autoread buffer contents on focus change
  au FocusGained * :checktime

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  au BufReadPost *
    \ if &ft !=? 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Theme {
  syntax enable
  set termguicolors
  " colorscheme base16-cupcake
  colorscheme base16-grayscale-light
  hi Search guibg=peru guifg=wheat
" }

" Completion {
  let g:UltiSnipsExpandTrigger = '<tab>'
  let g:UltiSnipsJumpForwardTrigger = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" }

" The Silver Searcher {
  if executable('ag')
    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'
    let g:ctrlp_use_caching = 0

    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
  endif
" }

" Shortcuts {
  " Map the leader key to SPACE
  let mapleader="\<SPACE>"

  " Get off my lawn
  nnoremap <Left> :echoe "Use h"<CR>
  nnoremap <Right> :echoe "Use l"<CR>
  nnoremap <Up> :echoe "Use k"<CR>
  nnoremap <Down> :echoe "Use j"<CR>

  " Quicker window movement
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  " Visual mode
  xnoremap <C-h> <C-w>h
  xnoremap <C-j> <C-w>j
  xnoremap <C-k> <C-w>k
  xnoremap <C-l> <C-w>l

  " Beginning and end of line shortcuts in command mode
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>

  " <jk> exits insert mode
  inoremap jk <esc>

  " CtrlP shortcuts
  nnoremap <Leader>o :CtrlP<CR>
  nnoremap <C-b> :CtrlPBuffer<CR>
  nnoremap <Leader>f :CtrlPMRUFiles<CR>

  nnoremap <Leader>m :Make<CR><C-w><Up>

  " Smart visual selection
  vmap v <Plug>(expand_region_expand)
  vmap <C-v> <Plug>(expand_region_shrink)

  nnoremap <F9> :Dispatch<CR>

  nnoremap <Leader>w :w<CR>
  nnoremap c> *``cgn
  nnoremap c< #``cgN

  " Copy to clipboard
  set clipboard+=unnamedplus

  vnoremap  <leader>y  "+y
  nnoremap  <leader>Y  "+yg_
  nnoremap  <leader>y  "+y

  nnoremap <leader>p "+p
  nnoremap <leader>P "+P
  vnoremap <leader>p "+p
  vnoremap <leader>P "+P

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
" }

" Lightline {
let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'filename' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'obsession' ] ],
  \ },
  \ 'component_function': {
  \   'filename': 'LightLineFilename',
  \   'fugitive': 'LightLineFugitive',
  \   'modified': 'LightLineModified',
  \   'readonly': 'LightLineReadonly',
  \ },
  \ 'component_expand': {
  \   'obsession': 'LightLineObsession',
  \ },
  \ }

function! LightLineModified()
  if &filetype ==? 'help'
    return ''
  elseif &modified
    return '+'
  elseif &modifiable
    return ''
  else
    return ''
  endif
endfunction

function! LightLineReadonly()
  if &filetype ==? 'help'
    return ''
  else
    return ''
  endif
endfunction

function! LightLineFugitive()
  return exists('*FugitiveHead') ? FugitiveHead() : ''
endfunction

function! LightLineFilename()
  return ('' !=? LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' !=? expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' !=? LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineObsession()
    return '%{ObsessionStatus()}'
endfunction
" }

" GitGutter {
  set signcolumn=yes
" }

" Go {
  " format with goimports instead of gofmt
  let g:go_fmt_command = 'goimports'

  " blinkenlichten
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_operators = 0
  let g:go_highlight_types = 0
  let g:go_highlight_build_constraints = 1
" }

" minpac commands
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
