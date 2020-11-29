source ~/.config/nvim/packages.vim

" Configuration {
  set showmatch              " Show matching brackets.
  set number                 " Show the line numbers on the left side.
  set relativenumber         " Hybrid line numbering.
  set cursorline             " Highlight the current line.
  set autowrite              " Automatically save before :next, :make etc.
  set hidden                 " Hide unsaved buffers.
  set noshowmode             " Disable default mode indicator.
  set numberwidth=5
  set formatoptions+=r       " Continue comment marker in new lines.
  set textwidth=80           " Break lines at 80 chars. Draw vertical margin.
  set colorcolumn=+1
  set linespace=0            " Set line-spacing to minimum.
  set noerrorbells
  set nomodeline
  set nostartofline          " Do not jump to first character with page commands.
  set nojoinspaces           " Don't add extra space after .! etc. when joining.
  set nofoldenable           " Don't fold by default.
  set foldmethod=indent
  set foldnestmax=4
  set ignorecase             " Ignores case when searching.
  set smartcase              " ...Unless you put some caps in your search term.
  set fileignorecase
  set wildignorecase
  set gdefault               " Use 'g' flag by default with :s/foo/bar/.
  set magic                  " Use extended regular expressions.
  set wildmode=longest:full,full
  set inccommand=nosplit     " Incrementally highlight substitution command.
  set undofile               " Enable undo history, disable swap.
  set undodir=$HOME/.config/nvim/undo//
  set noswapfile
  set clipboard+=unnamedplus " Copy to clipboard.
  set expandtab              " Soft tabs, 2 spaces by default.
  set tabstop=2
  set shiftwidth=2
  set shiftround
  set splitbelow             " Horizontal split below current.
  set splitright             " Vertical split to right of current.
  set diffopt+=vertical      " Always use vertical diffs.

  " Display extra whitespace.
  set list listchars=tab:»·,trail:·,nbsp:·,eol:¬
  " Remove special characters from filename.
  set isfname-=:
  set isfname-==
  set isfname-=+

  set timeoutlen=600         " User input timeout window

  " Blinking block cursor
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

  if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
  endif
  if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
  endif

  " assumes a POSIX-compatible shell for syntax when script is /bin/sh
  let g:is_posix=1

  " netrw use 'long' info style, disable banner
  let g:netrw_liststyle=1
  let g:netrw_altv=1
  let g:netrw_banner=0
  let g:netrw_browse_split=0
  let g:netrw_winsize=25
" }

" copy when on remote sessions {
  function! Osc52Yank() abort
    let buffer=system('base64 -w0', @0)
    let buffer=substitute(buffer, "\n$", "", "")
    let buffer='\e]52;c;'.buffer.'\x07'
    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape("/dev/pts/0")
  endfunction
  command! Osc52CopyYank call Osc52Yank()
  augroup clipboardOsc52
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
  augroup END
" }

augroup vimrcIni
  autocmd!

  " Disable undo for temp and sensitive files
  autocmd BufWritePre /tmp/* setlocal noundofile

  autocmd BufLeave,FocusLost,InsertEnter * :set norelativenumber
  autocmd BufEnter,FocusGained,InsertLeave * :set relativenumber number

  autocmd FocusGained * :checktime

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft !=? 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Theme {
  syntax enable
  set termguicolors
  colorscheme base16-grayscale-light

  " hi Comment cterm=italic gui=italic
  " hi Search guibg=peru guifg=wheat
" }

" Completion {
  let g:UltiSnipsJumpForwardTrigger  = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" }

" The Silver Searcher {
  if executable('ag')
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m

    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden --filename-pattern "" %s'
    let g:ctrlp_use_caching  = 0
    let g:ctrlp_types        = ['buf', 'fil']
    let g:ctrlp_extensions   = ['buffertag']
  endif
" }

" Shortcuts {
  " Map the leader key to SPACE
  let mapleader="\<SPACE>"

  " Quicker window movement
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  xnoremap <C-h> <C-w>h
  xnoremap <C-j> <C-w>j
  xnoremap <C-k> <C-w>k
  xnoremap <C-l> <C-w>l

  " Beginning and end of line shortcuts in command mode
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>

  " <jk> exits insert mode
  inoremap jk <esc>

  nnoremap <Leader>m :Make<CR><C-w><Up>
  nnoremap <F9> :Dispatch<CR>

  nnoremap <Leader>w :up<CR>
  nnoremap <Leader>b :ls<CR>:buffer<Space>
  nnoremap c> *``cgn
  nnoremap c< #``cgN

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
" }

"statusline {
  hi User1 guifg=#FFFFFF guibg=#191f26
  hi User2 guifg=#000000 guibg=#959ca6 gui=BOLD
  hi User3 guifg=#acacac guibg=#595959

  set statusline=
  set statusline+=%2*\ %{g:currentmode[mode()]}\ %*
  set statusline+=%1*\ %.20{StatuslineGit()}
  set statusline+=%1*\ \|\ %.80f\ %m
  set statusline+=%=%{ObsessionStatus()}
  set statusline+=\ \|\ %y\ %*
  set statusline+=%3*
  set statusline+=%3*\ %3p%%\ %*
  set statusline+=%*\ %5l:%-4c

  let g:currentmode={
        \ 'n': 'NORMAL',
        \ 'v': 'VISUAL',
        \ 'V': 'V-LINE',
        \ "\<C-v>": 'V-BLOCK',
        \ 'i': 'INSERT',
        \ 'R': 'REPLACE',
        \ 'Rv': 'V-REPLACE',
        \ 'c': 'COMMAND',
        \ 's' : 'SELECT',
        \ 'S' : 'S-LINE',
        \ "\<C-s>": 'S-BLOCK',
        \ 't': 'TERMINAL',
      \}

  function! StatuslineGit() abort
    return exists('*FugitiveHead') ? FugitiveHead(7) : ''
  endfunction
" }

" base64 helpers {
  vnoremap btoa c<c-r>=system('base64 --decode', @")<cr><esc>
  vnoremap atob c<c-r>=system('base64 --wrap 0', @")<cr><esc>
" }
