call plug#begin()
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'SirVer/ultisnips'
  Plug 'airblade/vim-gitgutter'
  Plug 'chriskempson/base16-vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'elzr/vim-json'
  Plug 'ervandew/supertab'
  Plug 'fatih/vim-go'
  Plug 'junegunn/vim-easy-align'
  Plug 'mhartington/oceanic-next'
  Plug 'neomake/neomake'
  Plug 'othree/yajs.vim'
  Plug 'rking/ag.vim'
  Plug 'terryma/vim-expand-region'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-scripts/ReplaceWithRegister'
call plug#end()

" Configuration {
  set showcmd             " Show (partial) command in status line.
  set showmatch           " Show matching brackets.
  set ruler               " Show the line and column numbers of the cursor.
  set number              " Show the line numbers on the left side.
  set relativenumber      " Hybrid line numbering
  set cursorline          " Highlight the current line
  set numberwidth=5
  set formatoptions+=o    " Continue comment marker in new lines.

  " Soft tabs, 2 spaces by default
  set expandtab
  set tabstop=2
  set shiftwidth=2
  set shiftround

  " When the type of shell script is /bin/sh, assume a POSIX-compatible
  " shell for syntax highlighting purposes.
  let g:is_posix = 1

  " Display extra whitespace
  set list listchars=tab:»·,trail:·,nbsp:·

  " Make it obvious where 80 characters is
  set textwidth=80
  set colorcolumn=+1

  set noerrorbells        " No beeps.
  set modeline            " Enable modeline.
  set esckeys             " Cursor keys in insert mode.
  set linespace=0         " Set line-spacing to minimum.

  set autoread            " If file updates, load automatically.
  set autochdir           " Switch to current file's parent directory.
  set autowrite           " Automatically save before :next, :make etc.
  set hidden
  set noshowmode          " Disable default mode indicator (use airline)

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

  set foldmethod=indent   "fold based on indent
  set foldnestmax=3       "deepest fold is 3 levels
  set nofoldenable        "dont fold by default

  set incsearch           " Incremental search.
  set hlsearch            " Highlights search terms
  set showmatch           " Highlights matching parentheses
  set ignorecase          " Ignores case when searching
  set smartcase           " Unless you put some caps in your search term
  set fileignorecase
  set wildignorecase
  set gdefault            " Use 'g' flag by default with :s/foo/bar/.
  set magic               " Use 'magic' patterns (extended regular expressions).
  set wildmenu            " visual autocomplete for commands
  set wildmode=longest:full,full
" }

augroup vimrcIni
  autocmd!

  au InsertEnter * :set norelativenumber
  au InsertLeave * :set relativenumber number

  au FileType javascript let b:dispatch = 'npm t'
  au FileType json setlocal foldmethod=syntax
  au BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " Align GitHub-flavored Markdown tables
  au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
  au BufRead,BufNewFile *.md set filetype=markdown

  autocmd BufWritePost,BufEnter * Neomake
augroup END

" Theme {
  syntax enable
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " set termguicolors
  colorscheme OceanicNext
  set background=dark
" }

" Completion {
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources = {}
  let g:deoplete#sources.javascript = ['buffer', 'ultisnips', 'file']

  let g:SuperTabDefaultCompletionType = '<c-n>'

  let g:UltiSnipsExpandTrigger = '<tab>'
  let g:UltiSnipsJumpForwardTrigger = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" }

" The Silver Searcher {
  if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0

    " search from project root instead of the default cwd
    let g:ag_working_path_mode="r"
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

  " <jk> exits insert mode
  inoremap jk <esc>

  " CtrlP shortcuts
  nnoremap <Leader>o :CtrlP<CR>
  nnoremap <Leader>b :CtrlPBuffer<CR>
  nnoremap <Leader>f :CtrlPMRUFiles<CR>

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
" }

" Airline {
  let g:airline#extensions#disable_rtp_load = 1
  let g:airline_extensions = ['quickfix', 'branch', 'hunks', 'ctrlp', 'wordcount', 'whitespace', 'tabline']

  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#right_sep = ' '
  let g:airline#extensions#tabline#right_alt_sep = '|'
  let g:airline_left_sep = ' '
  let g:airline_left_alt_sep = '|'
  let g:airline_right_sep = ' '
  let g:airline_right_alt_sep = '|'
  let g:airline_theme= 'oceanicnext'
" }

" GitGutter {
  let g:gitgutter_sign_column_always = 1
" }

" NeoMake {
  let g:neomake_javascript_enabled_makers = ['eslint']
" }

" Go {
  " format with goimports instead of gofmt
  let g:go_fmt_command = "goimports"

  " blinkenlichten
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
" }
