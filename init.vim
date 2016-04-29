call plug#begin()
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'rking/ag.vim'
  Plug 'terryma/vim-expand-region'
  Plug 'othree/yajs.vim'
  Plug 'mhartington/oceanic-next'
  Plug 'benekastah/neomake'
  Plug 'Shougo/deoplete.nvim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/neosnippet.vim'
  Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" nnoremap ; :    " Use ; for commands.
" nnoremap Q @q   " Use Q to execute default register.

" Configuration {

  set showcmd             " Show (partial) command in status line.
  set showmatch           " Show matching brackets.
  set ruler               " Show the line and column numbers of the cursor.
  set number              " Show the line numbers on the left side.
  set relativenumber      " Hybrid line numbering
  set numberwidth=5
  set formatoptions+=o    " Continue comment marker in new lines.
  set expandtab           " Insert spaces when TAB is pressed.
  set tabstop=2           " Render TABs using this many spaces.
  set shiftwidth=2        " Indentation amount for < and > commands.

  " Make it obvious where 80 characters is
  set textwidth=80
  set colorcolumn=+1

  set noerrorbells        " No beeps.
  set modeline            " Enable modeline.
  set esckeys             " Cursor keys in insert mode.
  set linespace=0         " Set line-spacing to minimum.

  set autoread            " If file updates, load automatically.
  set autochdir           " Switch to current file's parent directory.

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

  set display+=lastline
  set nostartofline       " Do not jump to first character with page commands.

  set nojoinspaces        " Don't add extra space after ., !, etc. when joining
  set formatoptions+=j    " Delete comment character when joining commented lines
" }

" GUI Options {
  set guioptions-=m " Removes top menubar
  set guioptions-=T " Removes top toolbar
  set guioptions-=r " Removes right hand scroll bar
  set go-=L " Removes left hand scroll bar<Paste>

  "Toggle menubar
  nnoremap <leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

  " Relative numbering
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber number

  " Sets a status line. If in a Git repository, shows the current branch.
  " Also shows the current file name, line and column number.
  if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    "set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif
" }

" Theme {
  syntax enable
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  colorscheme OceanicNext
  set background=dark
" }

" Search and completion settings {
  set hlsearch            " Highlights search terms
  set showmatch           " Highlights matching parentheses
  set ignorecase          " Ignores case when searching
  set smartcase           " Unless you put some caps in your search term
  set fileignorecase
  set wildignorecase

  set incsearch           " Incremental search.
  set gdefault            " Use 'g' flag by default with :s/foo/bar/.

  set magic               " Use 'magic' patterns (extended regular expressions).
" }

" The Silver Searcher {
  if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
" }

" ag.vim {
  let g:ag_working_path_mode="r"  " search from project root instead of the default cwd
" }

" CtrlP {
  nnoremap <Leader>o :CtrlP<CR>           " Open file menu
  nnoremap <Leader>b :CtrlPBuffer<CR>     " Open buffer menu
  nnoremap <Leader>f :CtrlPMRUFiles<CR>   " Open most recently used files

" Region Expanding {
  vmap v <Plug>(expand_region_expand)
  vmap <C-v> <Plug>(expand_region_shrink)
" }

" NERDTree {
  let NERDTreeQuitOnOpen=1
" }

" Shortcuts {
  nnoremap <Leader>w :w<CR>
  nnoremap c> *``cgn
  nnoremap c< #``cgN
" }

" Copy to clipboard {
  set clipboard+=unnamedplus

  vnoremap  <leader>y  "+y
  nnoremap  <leader>Y  "+yg_
  nnoremap  <leader>y  "+y

  nnoremap <leader>p "+p
  nnoremap <leader>P "+P
  vnoremap <leader>p "+p
  vnoremap <leader>P "+P
" }

" Airline {
  let g:airline#extensions#tabline#enabled = 2
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#right_sep = ' '
  let g:airline#extensions#tabline#right_alt_sep = '|'
  let g:airline_left_sep = ' '
  let g:airline_left_alt_sep = '|'
  let g:airline_right_sep = ' '
  let g:airline_right_alt_sep = '|'
  let g:airline_theme= 'base16_ocean'
" }

" Go {
  set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
  autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
  " format with goimports instead of gofmt
  let g:go_fmt_command = "goimports"
" }
